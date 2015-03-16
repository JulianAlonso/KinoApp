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

@implementation BillboardRouter

- (void)loadViewAt:(UITabBarController *)tabBarController
{
    BillboardViewController *billboardViewController = [[BillboardViewController alloc] init];
    billboardViewController.tabBarItem.title = @"Billboard";
    billboardViewController.router = self;
    
    BillboardCollectionDelegate *delegate = [BillboardCollectionDelegate new];
    billboardViewController.delegate = delegate;
    
    [tabBarController addChildViewController:billboardViewController];
}

@end
