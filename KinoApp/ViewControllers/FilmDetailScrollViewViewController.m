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

@interface FilmDetailScrollViewViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *refereceViewTopConstraint;
@property (weak, nonatomic) IBOutlet UIView *referenceView;
@property (weak, nonatomic) IBOutlet UILabel *filmTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *filmPrincipalDataLabel;
@property (weak, nonatomic) IBOutlet UILabel *filmOverviewLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *filmGenreCollectionView;
@property (weak, nonatomic) IBOutlet UITableView *filmListsTableView;
@property (weak, nonatomic) IBOutlet UIImageView *filmImageView;

@end

@implementation FilmDetailScrollViewViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
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
}

@end
