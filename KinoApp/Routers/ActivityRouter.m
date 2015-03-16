//
//  ActivityRouter.m
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "ActivityRouter.h"
#import "ActivityViewController.h"

@implementation ActivityRouter

- (void)loadViewAt:(UITabBarController *)tabBarCotroller
{
    ActivityViewController *activityViewController = [[ActivityViewController alloc] init];
    activityViewController.tabBarItem.title = @"Activity";
    
    [tabBarCotroller addChildViewController:activityViewController];
}

@end
