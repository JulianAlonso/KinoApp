//
//  CoreDataManager.m
//  KinoApp
//
//  Created by Julian Alonso on 17/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "CoreDataManager.h"
#import "CoreDataStack.h"

@implementation CoreDataManager

+ (NSManagedObjectContext *)privateObjectContext
{
    static NSManagedObjectContext *privateContext = nil;
    if (!privateContext)
    {
        privateContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
        [privateContext setPersistentStoreCoordinator:[CoreDataManager persistenceStoreCordinator]];
    }
    return privateContext;
}

+ (NSManagedObjectContext *)managedObjectContext
{
    return [[CoreDataManager coreDataStack] managedObjectContext];
}

+ (NSPersistentStoreCoordinator *)persistenceStoreCordinator
{
    return [[CoreDataManager coreDataStack] persistentStoreCoordinator];
}

+ (CoreDataStack *)coreDataStack
{
    static CoreDataStack *coreDataStack = nil;
    if (!coreDataStack)
    {
        coreDataStack = [[CoreDataStack alloc] init];
    }
    return coreDataStack;
}

@end
