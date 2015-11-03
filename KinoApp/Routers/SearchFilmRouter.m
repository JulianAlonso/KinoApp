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
#import "RouterAssembly.h"
#import "ViewControllersAssembly.h"

@implementation SearchFilmRouter

- (void)presentSearchFrom:(UINavigationController *)fromNavigationController andList:(ListDTO *)list
{
    SearchFilmViewController *searchFilmViewController = [self.viewControllersAssembly searchFilmViewController];
    searchFilmViewController.router = self;
    self.searchFilmViewController = searchFilmViewController;
    
    self.searchFilmViewController.fromList = list;
    
    [fromNavigationController pushViewController:self.searchFilmViewController animated:YES];
}

- (void)tappedCellWithFilm:(FilmDTO *)film
{
    [[self.routerAssembly detailFilmRouter] presentFilmDetailViewControllerFrom:self.searchFilmViewController.navigationController
                                                                    withFilmDTO:film];
}

- (void)popSearchFilmViewController
{
    [self.searchFilmViewController.navigationController popViewControllerAnimated:YES];
}

@end
