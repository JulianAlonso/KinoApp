//
//  MainRouter.m
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "MainRouter.h"
#import "ActivityRouter.h"
#import "BillboardRouter.h"

@interface MainRouter ()

@end

@implementation MainRouter

- (void)showMainViewInWindow:(UIWindow *)window
{
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    BillboardRouter *billboardRouter = [[BillboardRouter alloc] init];
    [billboardRouter loadViewAt:tabBarController];
    
    ActivityRouter *activityRouter = [[ActivityRouter alloc] init];
    [activityRouter loadViewAt:tabBarController];
    
    [window setRootViewController:tabBarController];
    [window makeKeyAndVisible];
}

@end
