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
    
    [tabBarCotroller addChildViewController:listsCollectionViewController];
}

@end
