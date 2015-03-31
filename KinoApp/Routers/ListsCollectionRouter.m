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

@interface ListsCollectionRouter ()

@property (nonatomic, weak) ListsCollectionViewController *listCollectionViewController;

@end

@implementation ListsCollectionRouter

- (void)loadViewAt:(UITabBarController *)tabBarCotroller
{
    ListsCollectionViewController *listsCollectionViewController = [ListsCollectionViewController new];
    listsCollectionViewController.tabBarItem.title = @"Lists";
    
    //DI
    FetchAllListsInteractor *fetchAllListsInteractor = [FetchAllListsInteractor new];
    id<LocalListsProvider> localListProvider = [LocalCoreDataListsProvider new];
    
    fetchAllListsInteractor.localListProvider = localListProvider;
    listsCollectionViewController.fetchAllListsInteractor = fetchAllListsInteractor;
    
    listsCollectionViewController.router = self;
    self.listCollectionViewController = listsCollectionViewController;
    
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:listsCollectionViewController];
    nc.tabBarItem.title = @"Lists";
    nc.tabBarItem.image = [UIImage imageNamed:@"Star"];
    
    [tabBarCotroller addChildViewController:nc];
}

- (void)tapAtCellWithListDTO:(ListDTO *)list
{
    DetailListRouter *detailListRouter = [DetailListRouter new];
    [detailListRouter presentDetailListViewControllerFrom:self.listCollectionViewController withList:list];
}

@end
