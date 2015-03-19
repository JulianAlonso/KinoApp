//
//  LocalCoreDataListsProvider.m
//  KinoApp
//
//  Created by Julian Alonso on 18/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "LocalCoreDataListsProvider.h"
#import "CoreDataManager.h"

@implementation LocalCoreDataListsProvider

- (void)fetchAllListsWithCompletion:(void (^)(NSArray *))completion
{
    NSLog(@"fetching");
}

#pragma mark - Lazy getters.
- (NSManagedObjectContext *)privateContext
{
    if (!_privateContext)
    {
        _privateContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
        _privateContext.persistentStoreCoordinator = [CoreDataManager persistenceStoreCordinator];
    }
    return _privateContext;
}

@end
