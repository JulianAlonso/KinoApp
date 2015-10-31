//
//  DetailFilmRouter.m
//  KinoApp
//
//  Created by Julian Alonso on 18/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "DetailFilmRouter.h"
#import "FilmDTO.h"
#import "LoadFilmInteractor.h"
#import "LocalCoreDataFilmsProvider.h"
#import "ExternalTMDBProvider.h"
#import "SelectListRouter.h"
#import "ListDTO.h"
#import "AddFilmToListInteractor.h"
#import "LocalCoreDataListsProvider.h"
#import "FilmDetailScrollViewViewController.h"

@implementation DetailFilmRouter

- (void)presentFilmDetailViewControllerFrom:(UINavigationController *)navigationController withFilmDTO:(FilmDTO *)film
{
    self.filmDetailScrollViewController.film = film;
    self.filmDetailScrollViewController.hidesBottomBarWhenPushed = YES;
    [navigationController pushViewController:self.filmDetailScrollViewController animated:YES];
}

- (void)popFilmDetailViewController
{
    [self.filmDetailScrollViewController.navigationController popViewControllerAnimated:YES];
}

@end
