//
//  ListsCollectionRouter.m
//  KinoApp
//
//  Created by Julian Alonso on 18/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "ListsCollectionRouter.h"
#import "ListsCollectionViewController.h"
#import "FetchAllListsInteractor.h"
#import "LocalListsProvider.h"
#import "LocalCoreDataListsProvider.h"
#import "ListDTO.h"
#import "DetailListRouter.h"
#import "RouterAssembly.h"

@implementation ListsCollectionRouter

- (void)loadViewAt:(UITabBarController *)tabBarCotroller
{
    #warning Not localized.
    self.listsCollectionViewController.tabBarItem.title = @"Lists";
    
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:self.listsCollectionViewController];
    #warning Not localized.
    nc.tabBarItem.title = @"Lists";
    nc.tabBarItem.image = [UIImage imageNamed:@"Star"];
    
    [tabBarCotroller addChildViewController:nc];
}

- (void)tapAtCellWithListDTO:(ListDTO *)list
{
    [[self.routerAssembly detailListRouter] presentDetailListViewControllerFrom:self.listsCollectionViewController
                                                                       withList:list];
}

@end
