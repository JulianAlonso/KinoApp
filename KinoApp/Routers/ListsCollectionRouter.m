//
//  ListsCollectionRouter.m
//  KinoApp
//
//  Created by Julian Alonso on 18/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "ListsCollectionRouter.h"
#import "ListsCollectionViewController.h"

@implementation ListsCollectionRouter

- (void)loadViewAt:(UITabBarController *)tabBarCotroller
{
    ListsCollectionViewController *listsCollectionViewController = [ListsCollectionViewController new];
    listsCollectionViewController.tabBarItem.title = @"Lists";
    
    [tabBarCotroller addChildViewController:listsCollectionViewController];
}

@end
