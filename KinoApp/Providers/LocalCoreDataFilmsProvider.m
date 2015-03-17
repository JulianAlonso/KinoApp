//
//  LocalCoreDataProvider.m
//  KinoApp
//
//  Created by Julian Alonso on 17/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "LocalCoreDataFilmsProvider.h"
#import "CoreDataManager.h"

@interface LocalCoreDataFilmsProvider ()

@property (nonatomic, strong) NSManagedObjectContext *privateContext;

@end

@implementation LocalCoreDataFilmsProvider

#pragma mark - LocalFilmsProvider methods.
- (void)saveFilms:(NSArray *)films
{
    
}

#pragma mark - Lazy getters.
- (NSManagedObjectContext *)privateContext
{
    if (!_privateContext)
    {
        _privateContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
        [_privateContext setPersistentStoreCoordinator:[CoreDataManager persistenceStoreCordinator]];
    }
    return _privateContext;
}

@end
