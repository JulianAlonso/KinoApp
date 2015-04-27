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

NSString *const kFilmGenresCollectionViewContentSizeProperty = @"filmGenreCollectionView.contentSize";
NSString *const kFilmListsTableViewContentSizeProperty = @"filmListsTableView.contentSize";

@interface FilmDetailScrollViewViewController ()

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

@end

@implementation FilmDetailScrollViewViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self registerObservers];
    [self configItems];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.refereceViewTopConstraint.constant = CGRectGetHeight(self.view.frame) - CGRectGetHeight(self.referenceView.frame) - 10.0f;
}

#pragma mark - Config methods.
- (void)configItems
{
    [self.filmImageView sd_setImageWithURL:[NSURL URLWithString:self.film.filmPosterPath]];
    self.filmTitleLabel.textColor = [UIColor whiteColor];
    self.filmTitleLabel.text = self.film.filmTitle;
    self.filmOverviewLabel.text = self.film.filmOverview;
    self.filmOverviewLabel.textColor = [UIColor whiteColor];
    self.filmGenreCollectionView.film = self.film;
    self.filmListsTableView.film = self.film;
}

#pragma mark - Update methods.
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
