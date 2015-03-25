//
//  DetailFilmRouter.m
//  KinoApp
//
//  Created by Julian Alonso on 18/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "DetailFilmRouter.h"
#import "FilmDTO.h"
#import "FilmDetailViewController.h"
#import "LoadFilmInteractor.h"
#import "LocalCoreDataFilmsProvider.h"
#import "ExternalTMDBProvider.h"
#import "SelectListRouter.h"
#import "ListDTO.h"
#import "AddFilmToListInteractor.h"
#import "LocalCoreDataListsProvider.h"

@interface DetailFilmRouter ()

@property (nonatomic, weak) FilmDetailViewController *detailViewController;

@end

@implementation DetailFilmRouter

- (void)presentFilmDetailViewControllerFrom:(UINavigationController *)navigationController withFilmDTO:(FilmDTO *)film
{
    FilmDetailViewController *filmDetail = [[FilmDetailViewController alloc] initWithNibName:NSStringFromClass([FilmDetailViewController class]) bundle:nil];
    filmDetail.film = film;
    
    //Creating Interactors
    LoadFilmInteractor *interactor = [LoadFilmInteractor new];
    interactor.localProvider = [LocalCoreDataFilmsProvider new];
    interactor.externalProvider = [ExternalTMDBProvider new];
    
    //DI
    filmDetail.interactor = interactor;
    filmDetail.router = self;
    
    self.detailViewController = filmDetail;
    
    [navigationController pushViewController:filmDetail animated:YES];
}

- (void)popFilmDetailViewController
{
    [self.detailViewController.navigationController popViewControllerAnimated:YES];
}

@end
