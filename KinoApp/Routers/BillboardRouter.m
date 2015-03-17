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
#import "PlayingNowCollectionDelegate.h"
#import "UpcomingCollectionDelegate.h"
#import "LoadUpcomingFilmsInteractor.h"

@implementation BillboardRouter

- (void)loadViewAt:(UITabBarController *)tabBarController
{
    BillboardViewController *billboardViewController = [[BillboardViewController alloc] init];
    billboardViewController.tabBarItem.title = @"Billboard";
    billboardViewController.router = self;
    
    BillboardCollectionDelegate *billboardDelegate = [BillboardCollectionDelegate new];
    ExternalTMDBProvider *externalFilmProvider = [ExternalTMDBProvider new];
    
    //Playing now collection delegate creation
    PlayingNowCollectionDelegate *playingNowDelegate = [PlayingNowCollectionDelegate new];
    LoadPlayingNowInteractor *loadPlayingNowInteractor = [LoadPlayingNowInteractor new];
    loadPlayingNowInteractor.externalProvider = externalFilmProvider;
    playingNowDelegate.interactor = loadPlayingNowInteractor;
    
    UpcomingCollectionDelegate *upcomingDelegate = [UpcomingCollectionDelegate new];
    LoadUpcomingFilmsInteractor *loadUpcomingInteractor = [LoadUpcomingFilmsInteractor new];
    loadUpcomingInteractor.externalProvider = externalFilmProvider;
    upcomingDelegate.interactor = loadUpcomingInteractor;
    
    billboardDelegate.cellDelegates = @[playingNowDelegate, upcomingDelegate];
    billboardViewController.delegate = billboardDelegate;
    
    [tabBarController addChildViewController:billboardViewController];
}

@end
