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

@implementation BillboardRouter

- (void)loadViewAt:(UITabBarController *)tabBarController
{
    BillboardViewController *billboardViewController = [[BillboardViewController alloc] init];
    billboardViewController.tabBarItem.title = @"Billboard";
    
    BillboardCollectionDelegate *billboardDelegate = [BillboardCollectionDelegate new];
    ExternalTMDBProvider *externalFilmsProvider = [ExternalTMDBProvider new];
    LocalCoreDataFilmsProvider *localFilmsProvider = [LocalCoreDataFilmsProvider new];
    
    //Playing now collection delegate creation
    BillboardFilmsCollectionDelegate *playingNowDelegate = [BillboardFilmsCollectionDelegate new];
    LoadPlayingNowInteractor *loadPlayingNowInteractor = [LoadPlayingNowInteractor new];
    loadPlayingNowInteractor.externalProvider = externalFilmsProvider;
    loadPlayingNowInteractor.localProvider = localFilmsProvider;
    playingNowDelegate.router = self;
    playingNowDelegate.interactor = loadPlayingNowInteractor;
    
    //Upcoming collection delegate creation
    BillboardFilmsCollectionDelegate *upcomingDelegate = [BillboardFilmsCollectionDelegate new];
    LoadUpcomingFilmsInteractor *loadUpcomingInteractor = [LoadUpcomingFilmsInteractor new];
    loadUpcomingInteractor.externalProvider = externalFilmsProvider;
    loadUpcomingInteractor.localProvider = localFilmsProvider;
    upcomingDelegate.router = self;
    upcomingDelegate.interactor = loadUpcomingInteractor;
    
    billboardDelegate.cellDelegates = @[playingNowDelegate, upcomingDelegate];
    billboardViewController.delegate = billboardDelegate;
    
    [tabBarController addChildViewController:billboardViewController];
}

@end
