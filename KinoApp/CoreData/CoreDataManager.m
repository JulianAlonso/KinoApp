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
