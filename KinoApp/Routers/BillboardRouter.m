//
//  BillboardRouter.m
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "BillboardRouter.h"
#import "BillboardViewController.h"
#import "BillboardCollectionDelegate.h"
#import "ExternalTMDBProvider.h"
#import "LoadPlayingNowInteractor.h"
#import "FilmsCollectionDelegate.h"
#import "LoadUpcomingFilmsInteractor.h"
#import "LocalCoreDataFilmsProvider.h"
#import "BillboardFilmsCollectionDelegate.h"
#import "FilmDTO.h"
#import "DetailFilmRouter.h"

@implementation BillboardRouter

- (void)loadViewAt:(UITabBarController *)tabBarController
{
    BillboardViewController *billboardViewController = [[BillboardViewController alloc] init];
    billboardViewController.tabBarItem.title = @"Billboard";
    billboardViewController.router = self;
    
    BillboardCollectionDelegate *billboardDelegate = [BillboardCollectionDelegate new];
    ExternalTMDBProvider *externalFilmsProvider = [ExternalTMDBProvider new];
    LocalCoreDataFilmsProvider *localFilmsProvider = [LocalCoreDataFilmsProvider new];
    
    //Playing now collection delegate creation
    BillboardFilmsCollectionDelegate *playingNowDelegate = [BillboardFilmsCollectionDelegate new];
    LoadPlayingNowInteractor *loadPlayingNowInteractor = [LoadPlayingNowInteractor new];
    loadPlayingNowInteractor.externalProvider = externalFilmsProvider;
    loadPlayingNowInteractor.localProvider = localFilmsProvider;
    playingNowDelegate.interactor = loadPlayingNowInteractor;
    playingNowDelegate.eventReceiver = billboardViewController;
    
    //Upcoming collection delegate creation
    BillboardFilmsCollectionDelegate *upcomingDelegate = [BillboardFilmsCollectionDelegate new];
    LoadUpcomingFilmsInteractor *loadUpcomingInteractor = [LoadUpcomingFilmsInteractor new];
    loadUpcomingInteractor.externalProvider = externalFilmsProvider;
    loadUpcomingInteractor.localProvider = localFilmsProvider;
    upcomingDelegate.interactor = loadUpcomingInteractor;
    upcomingDelegate.eventReceiver = billboardViewController;
    
    billboardDelegate.cellDelegates = @[playingNowDelegate, upcomingDelegate];
    billboardViewController.delegate = billboardDelegate;
    
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:billboardViewController];
    nc.navigationBarHidden = YES;
    
    [tabBarController addChildViewController:nc];
}

- (void)selectedCellWithFilmDTO:(FilmDTO *)filmDTO fromViewController:(UIViewController *)fromViewController
{
    [[DetailFilmRouter new] presentFilmDetailViewControllerFrom:fromViewController.navigationController withFilmDTO:filmDTO];
}

@end
