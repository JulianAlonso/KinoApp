//
//  MainRouter.m
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "MainRouter.h"
#import "BillboardRouter.h"
#import "ListsCollectionRouter.h"
#import "UIColor+Custom.h"

@implementation MainRouter

- (void)showMainViewInWindow:(UIWindow *)window
{
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    BillboardRouter *billboardRouter = [[BillboardRouter alloc] init];
    [billboardRouter loadViewAt:tabBarController];
    
    ListsCollectionRouter *activityRouter = [ListsCollectionRouter new];
    [activityRouter loadViewAt:tabBarController];
    
    [[UITabBar appearance] setBarTintColor:[UIColor appBGColor]];
    [[UITabBar appearance] setTintColor:[UIColor selectedItemColor]];
    [[UITabBar appearance] setTranslucent:NO];
    [[UITabBar appearance] setAlpha:0.9f];
    
    [window setRootViewController:tabBarController];
    [window makeKeyAndVisible];
}

@end
