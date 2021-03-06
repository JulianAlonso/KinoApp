//
//  CoreDataManager.h
//  KinoApp
//
//  Created by Julian Alonso on 17/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CoreDataStack;

@interface CoreDataManager : NSObject

+ (NSManagedObjectContext *)privateObjectContext;

+ (NSManagedObjectContext *)managedObjectContext;

+ (NSPersistentStoreCoordinator *)persistenceStoreCordinator;

+ (CoreDataStack *)coreDataStack;

@end
