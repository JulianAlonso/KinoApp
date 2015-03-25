//
//  InteractorsFactory.m
//  KinoApp
//
//  Created by Julian Alonso on 25/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "InteractorsFactory.h"
#import "FetchAllListsInteractor.h"
#import "LocalListsProvider.h"
#import "LocalCoreDataListsProvider.h"

@implementation InteractorsFactory

+ (FetchAllListsInteractor *)fetchAllListsInteractor
{
    FetchAllListsInteractor *fetchAllListInteractor = [FetchAllListsInteractor new];
    
    id<LocalListsProvider> localListProvider = [LocalCoreDataListsProvider new];
    
    fetchAllListInteractor.localListProvider = localListProvider;
    
    return fetchAllListInteractor;
}

@end
