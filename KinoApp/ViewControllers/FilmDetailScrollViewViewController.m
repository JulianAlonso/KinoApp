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
#import "FilmDetailHeaderView.h"
#import "DetailFilmRouter.h"
#import "JAStarsView.h"

#define CGRGBA(r, g, b, a) [[UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a] CGColor]
#define MIDDLE(max, min, number) MIN(max, MAX(min, number))

static NSString *const kFilmGenresCollectionViewContentSizeProperty = @"filmGenreCollectionView.contentSize";
static NSString *const kFilmListsTableViewContentSizeProperty = @"filmListsTableView.contentSize";
static CGFloat const kBottomMargin = 240.0f;

@interface FilmDetailScrollViewViewController () <FilmDetailHeaderViewDelegate, UIScrollViewDelegate>

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
@property (weak, nonatomic) IBOutlet FilmDetailHeaderView *filmDetailHeaderView;
@property (weak, nonatomic) IBOutlet JAStarsView *filmStarsView;
@property (weak, nonatomic) IBOutlet UILabel *filmVotesLabel;

@property (nonatomic, assign) CGFloat completeHeight;
@property (nonatomic, strong) CAGradientLayer *backgroundLayer;

@end

@implementation FilmDetailScrollViewViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.filmListsTableView.controllersAssembly = self.controllersAssembly;
    
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
    self.refereceViewTopConstraint.constant = CGRectGetHeight(self.view.frame) - MIN(CGRectGetHeight(self.referenceView.frame) + 10.0f, kBottomMargin);
    [self calculateReferences];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [super viewWillAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [super viewDidDisappear:animated];
}

#pragma mark - Config methods.
- (void)configItems
{
    dispatch_async(dispatch_get_main_queue(), ^{
        self.scrollView.delegate = self;
        self.filmDetailHeaderView.filmName = self.film.filmTitle;
        [self.filmImageView sd_setImageWithURL:[NSURL URLWithString:self.film.filmPosterPath]];
        self.filmTitleLabel.text = self.film.filmTitle;
        if (self.film.filmOverview)
        {
            NSMutableAttributedString *displayAttributedDescription = [[NSMutableAttributedString alloc] initWithString:self.film.filmOverview
                                                                                                             attributes:[self paragraphStylesToOverviewLabelWithFont:self.  filmOverviewLabel.font]];
            self.filmOverviewLabel.attributedText = displayAttributedDescription;
        }
        else
        {
            self.filmOverviewLabel.text = NSLocalizedString(@"No Overview", nil);
        }
        self.filmGenreCollectionView.film = self.film;
        self.filmListsTableView.fetchListsInteractor = self.fetchAllListInteractor;
        self.filmListsTableView.film = self.film;
        self.filmPrincipalDataLabel.text = [NSString stringWithFormat:NSLocalizedString(@"%@ minutes · %@", nil), (self.film.filmRuntime) ? self.film.filmRuntime : @" - ", self.film.filmYear];
        self.filmVotesLabel.text = [NSString stringWithFormat:@"(%@)", self.film.filmVotes];
        self.filmStarsView.note = self.film.filmVotesAverage;
    });
}

- (void)configStyles
{
    self.scrollView.contentInset = UIEdgeInsetsMake(0.0f, 0.0f, 64.0f, 0.0f);
    self.view.backgroundColor = [UIColor appBGColor];
    self.filmDetailHeaderView.contentView.alpha = 0.0f;
    self.filmDetailHeaderView.delegate = self;
    self.filmTitleLabel.textColor = [UIColor whiteColor];
    self.filmTitleLabel.font = [UIFont appFontWithSize:30];
    self.filmPrincipalDataLabel.font = [UIFont appFontWithSize:18.0f];
    self.filmPrincipalDataLabel.textColor = [UIColor whiteColor];
    self.filmVotesLabel.textColor = [UIColor whiteColor];
    self.filmOverviewLabel.textColor = [UIColor whiteColor];
}

- (void)configLayerView
{
    if (!self.backgroundLayer && self.scrollView.contentSize.width > 0)
    {
        self.backgroundLayer = [CAGradientLayer layer];
        self.backgroundLayer.frame = CGRectMake(0, 0, self.scrollView.contentSize.width, self.scrollView.contentSize.height + 800.0f);
        self.backgroundLayer.colors = @[(id)[[UIColor clearColor] CGColor], (id)CGRGBA(21, 21, 21, 0.8f)];
        self.backgroundLayer.startPoint = CGPointMake(0.0f, 0.0f);
        self.backgroundLayer.endPoint = CGPointMake(0.0f, 0.20f);
        
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

#pragma mark - Custom methods.
- (void)calculateReferences
{
    self.completeHeight = self.refereceViewTopConstraint.constant - CGRectGetHeight(self.filmDetailHeaderView.frame);
    CGFloat diference = self.scrollView.contentSize.height - CGRectGetHeight(self.view.bounds);
    self.completeHeight = (self.completeHeight > diference) ? diference : self.completeHeight;
}

- (NSDictionary *)paragraphStylesToOverviewLabelWithFont:(UIFont *)font
{
    NSMutableParagraphStyle *mutableParagraphStyle = [[NSMutableParagraphStyle alloc] init];
    mutableParagraphStyle.lineSpacing = 4;
    
    NSDictionary *fontSizeAttributes = @{NSFontAttributeName : font,
                                         NSForegroundColorAttributeName : [UIColor whiteColor],
                                         NSParagraphStyleAttributeName : mutableParagraphStyle};
    return fontSizeAttributes;
}

#pragma mark - UIScrollViewdelegate methods.
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat alpha = scrollView.contentOffset.y / self.completeHeight;
    alpha = MIDDLE(1, 0, alpha);
    self.filmDetailHeaderView.contentView.alpha = alpha;
}

#pragma mark - FilmDetailHeaderViewDelegate methods.
- (void)didTapAtBackButton:(UIButton *)sender
{
    [self.router popFilmDetailViewController];
}

#pragma mark - Dealloc.
- (void)dealloc
{
    [self unregisterObservers];
}

@end
