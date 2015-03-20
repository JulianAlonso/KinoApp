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

@interface SearchFilmRouter ()

@property (nonatomic, weak) SearchFilmViewController *searchFilmViewController;

@end

@implementation SearchFilmRouter

- (void)presentSearchFrom:(UINavigationController *)fromNavigationController andList:(ListDTO *)list
{
    SearchFilmViewController *searchFilmViewController = [SearchFilmViewController new];
    
    LoadPopularFilmsInteractor *loadPopularInteractor = [LoadPopularFilmsInteractor new];
    loadPopularInteractor.externalProvider = [ExternalTMDBProvider new];
    
    searchFilmViewController.popularInteractor = loadPopularInteractor;
    searchFilmViewController.fromList = list;
    searchFilmViewController.router = self;
    self.searchFilmViewController = searchFilmViewController;
    
    [fromNavigationController pushViewController:searchFilmViewController animated:YES];
}

@end
