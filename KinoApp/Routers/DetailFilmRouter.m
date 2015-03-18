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

@implementation DetailFilmRouter

- (void)presentFilmDetailViewControllerFrom:(UINavigationController *)navigationController withFilmDTO:(FilmDTO *)film
{
    FilmDetailViewController *filmDetail = [[FilmDetailViewController alloc] initWithNibName:NSStringFromClass([FilmDetailViewController class]) bundle:nil];
    filmDetail.film = film;
    
    //Creating Interactor
    LoadFilmInteractor *interactor = [LoadFilmInteractor new];
    interactor.localProvider = [LocalCoreDataFilmsProvider new];
    interactor.externalProvider = [ExternalTMDBProvider new];
    
    //DI
    filmDetail.interactor = interactor;
    
    [navigationController pushViewController:filmDetail animated:YES];
}

@end
