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
#import "RouterAssembly.h"

@implementation MainRouter

- (void)showMainViewInWindow:(UIWindow *)window
{
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    BillboardRouter *billboardRouter = [self.routerAssembly billboardRouter];
    [billboardRouter loadViewAt:tabBarController];
    
    ListsCollectionRouter *activityRouter = [self.routerAssembly listsCollectionRouter];
    [activityRouter loadViewAt:tabBarController];
    
    [self configApearance];
    
    [window setRootViewController:tabBarController];
    [window makeKeyAndVisible];
}

- (void)configApearance
{
    [[UITabBar appearance] setBarTintColor:[UIColor appBGColor]];
    [[UITabBar appearance] setTintColor:[UIColor selectedItemColor]];
    [[UITabBar appearance] setTranslucent:NO];
    [[UITabBar appearance] setAlpha:0.9f];
    
    [[UINavigationBar appearance] setTintColor:[UIColor selectedItemColor]];
    [[UINavigationBar appearance] setBarTintColor:[UIColor appBGColor]];
    [[UINavigationBar appearance] setTranslucent:NO];
    
    [[UISearchBar appearance] setTintColor:[UIColor unselectedItemColor]];
    
    [[UINavigationBar appearance] setTitleTextAttributes: @{NSForegroundColorAttributeName : [UIColor selectedItemColor]}];
}

@end
