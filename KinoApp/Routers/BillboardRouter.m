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

@implementation BillboardRouter

- (void)loadViewAt:(UITabBarController *)tabBarController
{
    BillboardViewController *billboardViewController = [[BillboardViewController alloc] init];
    billboardViewController.tabBarItem.title = @"Billboard";
    billboardViewController.router = self;
    
    LoadBillboardInteractor *loadBillboardInteractor = [LoadBillboardInteractor new];
    BillboardCollectionDelegate *delegate = [BillboardCollectionDelegate new];
    ExternalTMDBProvider *externalFilmProvider = [ExternalTMDBProvider new];
    
    loadBillboardInteractor.externalProvider = externalFilmProvider;
    delegate.loadBillboardInteractor = loadBillboardInteractor;
    billboardViewController.delegate = delegate;
    
    [tabBarController addChildViewController:billboardViewController];
}

@end
