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

@implementation BillboardRouter

- (void)loadViewAt:(UITabBarController *)tabBarController
{
    BillboardViewController *billboardViewController = [[BillboardViewController alloc] init];
    billboardViewController.tabBarItem.title = @"Billboard";
    billboardViewController.router = self;
    
    LoadPlayingNowInteractor *loadPlayingNowInteractor = [LoadPlayingNowInteractor new];
    BillboardCollectionDelegate *delegate = [BillboardCollectionDelegate new];
    ExternalTMDBProvider *externalFilmProvider = [ExternalTMDBProvider new];
    
    loadPlayingNowInteractor.externalProvider = externalFilmProvider;
    delegate.cellDelegateClasses = @[[PlayingNowCollectionDelegate class], [UpcomingCollectionDelegate class]];
    billboardViewController.delegate = delegate;
    
    [tabBarController addChildViewController:billboardViewController];
}

@end
