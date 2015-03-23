//
//  SearchListRouter.m
//  KinoApp
//
//  Created by Julian Alonso on 20/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "SearchFilmRouter.h"
#import "SearchFilmViewController.h"
#import "LoadPopularFilmsInteractor.h"
#import "ExternalTMDBProvider.h"
#import "SearchFilmInteractor.h"
#import "DetailFilmRouter.h"

@interface SearchFilmRouter ()

@property (nonatomic, weak) SearchFilmViewController *searchFilmViewController;

@end

@implementation SearchFilmRouter

- (void)presentSearchFrom:(UINavigationController *)fromNavigationController andList:(ListDTO *)list
{
    SearchFilmViewController *searchFilmViewController = [SearchFilmViewController new];
    
    LoadPopularFilmsInteractor *loadPopularInteractor = [LoadPopularFilmsInteractor new];
    loadPopularInteractor.externalProvider = [ExternalTMDBProvider new];
    SearchFilmInteractor *searchInteractor = [SearchFilmInteractor new];
    searchInteractor.externalProvider = [ExternalTMDBProvider new];
    
    searchFilmViewController.popularInteractor = loadPopularInteractor;
    searchFilmViewController.searchInteractor = searchInteractor;
    searchFilmViewController.fromList = list;
    searchFilmViewController.router = self;
    self.searchFilmViewController = searchFilmViewController;
    
    [fromNavigationController pushViewController:searchFilmViewController animated:YES];
}

- (void)tappedCellWithFilm:(FilmDTO *)film
{
    [[DetailFilmRouter new] presentFilmDetailViewControllerFrom:self.searchFilmViewController.navigationController withFilmDTO:film];
}

@end
