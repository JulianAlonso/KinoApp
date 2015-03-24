//
//  FilmDetailViewController.m
//  KinoApp
//
//  Created by Julian Alonso on 18/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>
#import "FilmDetailViewController.h"
#import "FilmDTO.h"
#import "LoadFilmInteractor.h"
#import "DetailFilmRouter.h"
#import "AddFilmToListInteractor.h"
#import "ListDTO.h"
#import "UIColor+Custom.h"
#import "UIFont+Custom.h"
#import "TitleFilmDetailTableViewCell.h"
#import "OverviewFilmDetailTableViewCell.h"
#import "FilmDetailViewCell.h"
#import "FilmDetailTableViewCellFactory.h"
#import "GenresFilmDetailTableViewCell.h"
#import "ListFilmDetailTableViewCell.h"
#import "GrayBackgroundLayer.h"

@interface FilmDetailViewController ()

@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topTableViewConstraint;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *customNavBarView;
@property (weak, nonatomic) IBOutlet UITableView *filmDetailTableView;

@property (weak, nonatomic) IBOutlet UILabel *filmTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *filmImageView;

@property (nonatomic, strong) GrayBackgroundLayer *grayLayer;

@end

@interface FilmDetailViewController (DataSourceDelegate) <UITableViewDataSource, UITableViewDelegate>

@end

@implementation FilmDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configNavBar];
    [self configStyles];
    [self configBackButton];
    [self configGrayLayer];
    [self configTableView];
    
    [self configItemsWithFilm:self.film];
    [self updateFilm];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidAppear:(BOOL)animated
{

}

- (void)viewDidLayoutSubviews
{
    static CGFloat topHeight;
    if (!topHeight)
    {
        topHeight = self.topHeightConstraint.constant;
    }
    self.topHeightConstraint.constant = self.topLayoutGuide.length + topHeight;
    self.topTableViewConstraint.constant = CGRectGetHeight(self.view.frame) - 40;
}

#pragma mark - Config methods.
- (void)configNavBar
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)configGrayLayer
{
    self.grayLayer = [[GrayBackgroundLayer alloc] init];
}

- (void)configBackButton
{
    [self.backButton addTarget:self action:@selector(backButtonPressed) forControlEvents:UIControlEventTouchUpInside];
}

- (void)configItemsWithFilm:(FilmDTO *)film
{
    self.filmTitleLabel.text = film.filmTitle;
//    self.filmDescriptionLabel.text = [film.filmOverview isEqualToString:@"<null>"] ? nil : film.filmOverview;
    [self.filmImageView sd_setImageWithURL:[NSURL URLWithString:film.filmPosterPath]];
}

- (void)configStyles
{
    self.filmTitleLabel.textColor = [UIColor selectedItemColor];
    self.filmTitleLabel.font = [UIFont appFontWithSize:20];
    self.customNavBarView.alpha = 0.0f;
}

- (void)configTableView
{
    self.filmDetailTableView.delegate = self;
    self.filmDetailTableView.dataSource = self;
    self.filmDetailTableView.backgroundColor = [UIColor clearColor];
    
    [self registerCellWithClass:[TitleFilmDetailTableViewCell class]];
    [self registerCellWithClass:[OverviewFilmDetailTableViewCell class]];
    [self registerCellWithClass:[GenresFilmDetailTableViewCell class]];
    [self registerCellWithClass:[ListFilmDetailTableViewCell class]];
}

- (void)updateFilm
{
    __weak typeof(self) weakSelf = self;
    [self.interactor loadFilmWithId:self.film.filmId completion:^(FilmDTO *film) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
           [weakSelf configItemsWithFilm:film];
        });
        
    } update:^(FilmDTO *film) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf configItemsWithFilm:film];
        });
        
    }];
}

#pragma mark - Extern methods.
- (void)saveFilmToList:(ListDTO *)list
{
    __weak typeof(self) weakSelf = self;
    [self.addFilmInteractor addFilm:self.film toList:list completion:^(NSError *error) {
        NSLog(@"Saved film: %@ to list: %@", weakSelf.film.filmTitle, list.listName);
    }];
}

#pragma mark - Action methods.
- (void)backButtonPressed
{
    [self.router popFilmDetailViewController];
}

#pragma mark - Override methods.
- (BOOL)hidesBottomBarWhenPushed
{
    return YES;
}

#pragma mark - Own methods.
- (void)registerCellWithClass:(Class)clazz
{
    [self.filmDetailTableView registerNib:[UINib nibWithNibName:NSStringFromClass(clazz) bundle:nil] forCellReuseIdentifier:NSStringFromClass(clazz)];
}

@end


@implementation FilmDetailViewController (DataSourceDelegate)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<FilmDetailViewCell> cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([FilmDetailTableViewCellFactory cellClassForIndexpath:indexPath])];
    
    id<DetailFilmTableViewCellController> controller = [FilmDetailTableViewCellFactory controllerForCellClass:[cell class]];
    
    controller.cell = cell;
    controller.film = self.film;

    return [controller configuredCell];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [UIView animateWithDuration:3.5f animations:^{
        self.topTableViewConstraint.constant = 200 ;
        [self.view layoutIfNeeded];
    }];
}

@end
