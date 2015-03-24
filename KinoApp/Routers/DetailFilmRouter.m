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
    AddFilmToListInteractor *addInteractor = [AddFilmToListInteractor new];
    addInteractor.localProvider = [LocalCoreDataListsProvider new];
    
    //DI
    filmDetail.interactor = interactor;
    filmDetail.addFilmInteractor = addInteractor;
    filmDetail.router = self;
    
    self.detailViewController = filmDetail;
    
    [navigationController pushViewController:filmDetail animated:YES];
}

- (void)addButtonPressedFrom:(UIViewController *)fromViewController withFilmDTO:(FilmDTO *)film
{    
    SelectListRouter *router = [SelectListRouter new];
    [router presentModallyFromViewController:fromViewController.navigationController andRouter:self];
}

- (void)dismissedSelectListViewControllerWithSelectedList:(ListDTO *)list
{
    [self.detailViewController saveFilmToList:list];
}

@end
