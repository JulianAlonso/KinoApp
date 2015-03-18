//
//  FilmDetailViewController.m
//  KinoApp
//
//  Created by Julian Alonso on 18/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "FilmDetailViewController.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "FilmDTO.h"
#import "LoadFilmInteractor.h"

@interface FilmDetailViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;
@property (weak, nonatomic) IBOutlet UIImageView *backButton;

@property (weak, nonatomic) IBOutlet UILabel *filmTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *filmDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *filmImageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation FilmDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    [self configItemsWithFilm:self.film];
    [self updateFilm];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews
{
    self.bottomConstraint.constant = self.bottomLayoutGuide.length;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

#pragma mark - Config methods.
- (void)configItemsWithFilm:(FilmDTO *)film
{
    self.filmTitleLabel.text = film.filmTitle;
    self.filmDescriptionLabel.text = [film.filmOverview isEqualToString:@"<null>"] ? nil : film.filmOverview;
    [self.filmImageView setImageWithURL:[NSURL URLWithString:film.filmPosterPath]];
}


- (void)updateFilm
{
    [self showAndStartActivityIndicator];
    __weak typeof(self) weakSelf = self;
    [self.interactor loadFilmWithId:self.film.filmId completion:^(FilmDTO *film) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
           [weakSelf configItemsWithFilm:film];
        });
        
    } update:^(FilmDTO *film) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf configItemsWithFilm:film];
            [weakSelf hideAndStopActivityIndicator];
        });
        
    }];
}

#pragma mark - ActivityIndicator methods.
- (void)showAndStartActivityIndicator
{
    self.activityIndicator.alpha = 1.0f;
    [self.activityIndicator startAnimating];
}

- (void)hideAndStopActivityIndicator
{
    [self.activityIndicator stopAnimating];
    self.activityIndicator.alpha = 0.0f;
}

@end
