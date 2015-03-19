//
//  LocalCoreDataListsProvider.m
//  KinoApp
//
//  Created by Julian Alonso on 18/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "LocalCoreDataListsProvider.h"
#import "CoreDataManager.h"
#import "List.h"
#import "ListDTOParser.h"

@implementation LocalCoreDataListsProvider

- (void)fetchAllListsWithCompletion:(void (^)(NSArray *))completion
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass([List class])];
    
    NSError *error;
    NSArray *lists = [self.privateContext executeFetchRequest:request error:&error];
    
    if (error)
    {
        completion([NSArray array]);
        return;
    }
    
    if (lists.count == 0)
    {
        [self createPrincipalLists];
        [self fetchAllListsWithCompletion:completion];
        return;
    }
    
    completion([ListDTOParser listDTOsFromLists:lists]);
}

- (void)saveListWithName:(NSString *)name completion:(void(^)(NSArray *lists))completion
{
    List *list = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([List class]) inManagedObjectContext:self.privateContext];
    
    list.listName = name;
    
    [self.privateContext save:nil];
    
    [self fetchAllListsWithCompletion:completion];
}

- (void)createPrincipalLists
{
    [self saveListWithName:@"Ver cine" completion:^(NSArray *lists) {
        
    }];
    
    [self saveListWithName:@"Ver casa" completion:^(NSArray *lists) {
        
    }];
    
    [self saveListWithName:@"Top 15" completion:^(NSArray *lists) {
        
    }];
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
