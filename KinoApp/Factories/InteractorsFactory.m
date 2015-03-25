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
#import "AddFilmToListInteractor.h"
#import "RemoveFilmFromListInteractor.h"

@implementation InteractorsFactory

+ (FetchAllListsInteractor *)fetchAllListsInteractor
{
    FetchAllListsInteractor *fetchAllListInteractor = [FetchAllListsInteractor new];
    
    id<LocalListsProvider> localListProvider = [LocalCoreDataListsProvider new];
    
    fetchAllListInteractor.localListProvider = localListProvider;
    
    return fetchAllListInteractor;
}

+ (AddFilmToListInteractor *)addFilmToListInteractor
{
    AddFilmToListInteractor *addInteractor = [AddFilmToListInteractor new];
    
    id<LocalListsProvider> localListProvider = [LocalCoreDataListsProvider new];
    
    addInteractor.localProvider = localListProvider;
    
    return addInteractor;
}

+ (RemoveFilmFromListInteractor *)removeFilmFromListInteractor
{
    RemoveFilmFromListInteractor *removeInteractor = [RemoveFilmFromListInteractor new];
    
    id<LocalListsProvider> localListProvider = [LocalCoreDataListsProvider new];
    
    removeInteractor.localListProvider = localListProvider;
    
    return removeInteractor;
}

@end
