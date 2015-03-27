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
#import "PrincipalDataFilmDetailTableViewCell.h"
#import "SizeHelper.h"

#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define CGRGBA(r, g, b, a) [[UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a] CGColor]

@interface FilmDetailViewController ()

@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topTableViewConstraint;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *customNavBarView;
@property (weak, nonatomic) IBOutlet UITableView *filmDetailTableView;
@property (weak, nonatomic) IBOutlet UIView *layerView;


@property (weak, nonatomic) IBOutlet UILabel *filmTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *filmImageView;

@property (nonatomic, strong) CAGradientLayer *backgroundLayer;

@property (nonatomic, assign) CGFloat dragOrigin;

@end

@interface FilmDetailViewController (DataSourceDelegate) <UITableViewDataSource, UITableViewDelegate>

@end

@implementation FilmDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configBackButton];
    [self configTableView];
    [self configStyles];
    
    [self configItems];
    [self updateFilm];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
    self.topTableViewConstraint.constant = 0;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLayoutSubviews
{
    static CGFloat topHeight;
    if (!topHeight)
    {
        topHeight = self.topHeightConstraint.constant;
    }
    self.topHeightConstraint.constant = self.topLayoutGuide.length + topHeight;
    [self configTableViewHeader];
    [self configLayerView];
}

#pragma mark - Config methods.
- (void)configBackButton
{
    [self.backButton addTarget:self action:@selector(backButtonPressed) forControlEvents:UIControlEventTouchUpInside];
}

- (void)configItems
{
    self.filmTitleLabel.text = self.film.filmTitle;
    [self.filmImageView sd_setImageWithURL:[NSURL URLWithString:self.film.filmPosterPath]];
}

- (void)configStyles
{
    self.filmTitleLabel.textColor = [UIColor selectedItemColor];
    self.filmTitleLabel.font = [UIFont appFontWithSize:20];
    self.customNavBarView.alpha = 0.0f;
}

- (void)configLayerView
{
    if (!self.backgroundLayer)
    {
        self.backgroundLayer = [CAGradientLayer layer];
        self.backgroundLayer.frame = self.layerView.bounds;
        self.backgroundLayer.colors = @[(id)[[UIColor clearColor] CGColor], (id)CGRGBA(21, 21, 21, 0.8f)];
        self.backgroundLayer.startPoint = CGPointMake(0.5f, 0.0f);
        self.backgroundLayer.endPoint = CGPointMake(0.5f, 0.75f);
        [self.layerView.layer insertSublayer:self.backgroundLayer atIndex:0];
    }
}

- (void)configTableView
{
    self.filmDetailTableView.delegate = self;
    self.filmDetailTableView.dataSource = self;
    self.filmDetailTableView.backgroundColor = [UIColor clearColor];
    self.filmDetailTableView.separatorColor = [UIColor clearColor];
    
    [self registerCellWithClass:[TitleFilmDetailTableViewCell class]];
    [self registerCellWithClass:[PrincipalDataFilmDetailTableViewCell class]];
    [self registerCellWithClass:[OverviewFilmDetailTableViewCell class]];
    [self registerCellWithClass:[GenresFilmDetailTableViewCell class]];
    [self registerCellWithClass:[ListFilmDetailTableViewCell class]];
}

- (void)configTableViewHeader
{
    self.filmDetailTableView.tableHeaderView = [[UIView alloc] initWithFrame:[self headerTableViewFrame]];
}

- (void)updateFilm
{
    __weak typeof(self) weakSelf = self;
    [self.interactor loadFilmWithId:self.film.filmId completion:^(FilmDTO *film) {
            
        if (!film)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.film = film;
                [weakSelf.filmDetailTableView reloadData];
            });
        }
        
    } update:^(FilmDTO *film) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            weakSelf.film = film;
            [weakSelf.filmDetailTableView reloadData];
        });
        
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

- (CGRect)headerTableViewFrame
{
    CGFloat finalHeigth = CGRectGetHeight(self.view.bounds);
    
    CGFloat tableWidth = CGRectGetWidth(self.filmDetailTableView.bounds);

    finalHeigth -= [SizeHelper titleFilmDetailTableViewCellHeightForFilm:self.film andWidth:tableWidth];
    finalHeigth -= [SizeHelper principalFilmDetailTableViewCellHeightForFilm:self.film andWidth:tableWidth];
    finalHeigth -= [SizeHelper overviewFilmDetailTableViewCellHeightForFilm:self.film andWidth:tableWidth];
    
    NSLog(@"FINAL HEIGHT: %f", finalHeigth);
    
    [self setBackgroundLayerStartPoint:[self calculateStartPointFrom:finalHeigth]];
    
    return CGRectMake(0, 0, CGRectGetWidth(self.filmDetailTableView.frame), finalHeigth);
}

- (void)setBackgroundLayerStartPoint:(CGPoint)point
{
        self.backgroundLayer.startPoint = point;
        self.backgroundLayer.endPoint = CGPointMake(point.x, point.x + 0.25f);
}

- (CGPoint)calculateStartPointFrom:(CGFloat)height
{
    CGFloat startX = height / CGRectGetHeight(self.view.bounds);
    
    static CGFloat original;
    if (!original)
    {
        original = self.backgroundLayer.startPoint.x;
    }
    
    CGFloat final = original - startX;
    
    return CGPointMake(final, 0.0f);
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
    return 5;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    self.dragOrigin = scrollView.contentOffset.y;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    [self setBackgroundLayerStartPoint:[self calculateStartPointFrom:scrollView.contentOffset.y]];
    NSLog(@"DRAG ORIGIN: %f", self.dragOrigin);
    NSLog(@"Scrol did scroll: %f", scrollView.contentOffset.y);
    
}

@end
