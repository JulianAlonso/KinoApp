//
//  FilmDetailScrollViewViewController.m
//  KinoApp
//
//  Created by Julian Alonso on 24/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "FilmDetailScrollViewViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "FilmDTO.h"
#import "FilmGenresCollectionView.h"
#import "FilmCollectionsInTableView.h"
#import "LoadFilmInteractor.h"
#import "UIFont+Custom.h"
#import "UIColor+Custom.h"

#define CGRGBA(r, g, b, a) [[UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a] CGColor]

NSString *const kFilmGenresCollectionViewContentSizeProperty = @"filmGenreCollectionView.contentSize";
NSString *const kFilmListsTableViewContentSizeProperty = @"filmListsTableView.contentSize";

@interface FilmDetailScrollViewViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *refereceViewTopConstraint;
@property (weak, nonatomic) IBOutlet UIView *referenceView;
@property (weak, nonatomic) IBOutlet UILabel *filmTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *filmPrincipalDataLabel;
@property (weak, nonatomic) IBOutlet UILabel *filmOverviewLabel;
@property (weak, nonatomic) IBOutlet FilmGenresCollectionView *filmGenreCollectionView;
@property (weak, nonatomic) IBOutlet FilmCollectionsInTableView *filmListsTableView;
@property (weak, nonatomic) IBOutlet UIImageView *filmImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *filmGenresCollectionViewHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *filmListTableViewHeightConstraint;
@property (weak, nonatomic) IBOutlet UIView *gradientLayerView;

@property (nonatomic, strong) CAGradientLayer *backgroundLayer;

@end

@implementation FilmDetailScrollViewViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self registerObservers];
    [self configStyles];
    [self configItems];
    [self updateFilm];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    [self configLayerView];
    self.refereceViewTopConstraint.constant = CGRectGetHeight(self.view.frame) - CGRectGetHeight(self.referenceView.frame) - 10.0f;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    CGRect bounds = self.navigationController.navigationBar.bounds;
//    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
//    visualEffectView.frame = bounds;
//    visualEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//    [self.navigationController.navigationBar addSubview:visualEffectView];
//    [self.navigationController.navigationBar setBarTintColor:[UIColor clearColor]];
//    [self.navigationController.navigationBar setTintColor:[UIColor clearColor]];
//    [self.navigationController.navigationBar setBackgroundColor:[UIColor clearColor]];
//    [self.navigationController.navigationBar sendSubviewToBack:visualEffectView];
//    self.navigationController.navigationBar.alpha = 0.0f;
}

#pragma mark - Config methods.
- (void)configItems
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.filmImageView sd_setImageWithURL:[NSURL URLWithString:self.film.filmPosterPath]];
        self.filmTitleLabel.text = self.film.filmTitle;
        self.filmOverviewLabel.text = self.film.filmOverview;
        self.filmGenreCollectionView.film = self.film;
        self.filmListsTableView.film = self.film;
        self.filmPrincipalDataLabel.text = [NSString stringWithFormat:@"%@ minutes  ·  %@", self.film.filmRuntime, self.film.filmYear];
    });
}

- (void)configStyles
{
    self.view.backgroundColor = [UIColor appBGColor];
    self.filmTitleLabel.textColor = [UIColor whiteColor];
    self.filmTitleLabel.font = [UIFont appFontWithSize:30];
    self.filmPrincipalDataLabel.font = [UIFont appFontWithSize:20.0f];
    self.filmPrincipalDataLabel.textColor = [UIColor whiteColor];
    self.filmOverviewLabel.textColor = [UIColor whiteColor];
}

- (void)configLayerView
{
    if (!self.backgroundLayer && self.scrollView.contentSize.width > 0)
    {
        self.backgroundLayer = [CAGradientLayer layer];
        self.backgroundLayer.frame = CGRectMake(0, 0, self.scrollView.contentSize.width, self.scrollView.contentSize.height + 200.0f);
        self.backgroundLayer.colors = @[(id)[[UIColor clearColor] CGColor], (id)CGRGBA(21, 21, 21, 0.8f)];
        self.backgroundLayer.startPoint = CGPointMake(0.0f, 0.00f);
        self.backgroundLayer.endPoint = CGPointMake(0.0f, 0.025f);
        
        [self.gradientLayerView.layer addSublayer:self.backgroundLayer];
    }
}

#pragma mark - Update methods.
- (void)updateFilm
{
    __weak typeof(self) weakSelf = self;
    void(^updateFilmBlock)(FilmDTO *film) = ^(FilmDTO *film){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.film = film;
        [strongSelf configItems];
    };
    
    [self.loadFilmInteractor loadFilmWithId:self.film.filmId completion:updateFilmBlock update:updateFilmBlock];
}

- (void)updateFilmGenresCollectionViewHeight
{
    self.filmGenresCollectionViewHeightConstraint.constant = self.filmGenreCollectionView.contentSize.height;
}
- (void)updateFilmListsTableViewheight
{
    self.filmListTableViewHeightConstraint.constant = self.filmListsTableView.contentSize.height;
}

#pragma mark - Observe methods.
- (void)registerObservers
{
    [self addObserver:self forKeyPath:kFilmGenresCollectionViewContentSizeProperty options:NSKeyValueObservingOptionInitial context:nil];
    [self addObserver:self forKeyPath:kFilmListsTableViewContentSizeProperty options:NSKeyValueObservingOptionInitial context:nil];
}

- (void)unregisterObservers
{
    [self removeObserver:self forKeyPath:kFilmGenresCollectionViewContentSizeProperty];
    [self removeObserver:self forKeyPath:kFilmListsTableViewContentSizeProperty];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:kFilmGenresCollectionViewContentSizeProperty])
    {
        [self updateFilmGenresCollectionViewHeight];
    }
    else if([keyPath isEqualToString:kFilmListsTableViewContentSizeProperty])
    {
        [self updateFilmListsTableViewheight];
    }
}

#pragma mark - Dealloc.
- (void)dealloc
{
    [self unregisterObservers];
}


@end
