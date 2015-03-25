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
#import "ListDTO.h"
#import "Film.h"
#import "Film+Model.h"
#import "FilmDTO.h"

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

- (void)addFilm:(FilmDTO *)film toList:(ListDTO *)list completion:(void (^)(ListDTO *list, NSError *))completion
{
    __weak typeof(self) weakSelf = self;
    [self fetchListWithName:list.listName completion:^(List *listMO) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
        Film *filmMO = [strongSelf fetchFilmById:film.filmId];
        
        [listMO addListFilmsObject:filmMO];
        
        NSError *error;
        [strongSelf.privateContext save:&error];
        
        completion([ListDTOParser listDTOFromList:listMO], error);
    }];
}

- (void)removeFilm:(FilmDTO *)film fromList:(ListDTO *)list completion:(void(^)(ListDTO *list, NSError *error))completion
{
    __weak typeof(self) weakSelf = self;
    [self fetchListWithName:list.listName completion:^(List *listMO) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
        Film *filmMO = [strongSelf fetchFilmById:film.filmId];
        
        [listMO removeListFilmsObject:filmMO];
        
        NSError *error;
        [strongSelf.privateContext save:&error];
        
        completion([ListDTOParser listDTOFromList:listMO], error);
    }];
}

#pragma mark - Own methods.
- (void)fetchListWithName:(NSString *)listName completion:(void(^)(List *listMO))completion
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass([List class])];
    request.predicate = [NSPredicate predicateWithFormat:@"%K == %@", kListNameProperty, listName];
    
    NSError *error;
    List *listMO = [[self.privateContext executeFetchRequest:request error:&error] firstObject];
    
    completion(listMO);
}

/*
    ¡¡THIS MUST NOT BE HERE!!
 */
- (Film *)fetchFilmById:(NSString *)filmId
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass([Film class])];
    request.predicate = [NSPredicate predicateWithFormat:@"%K == %@", kFilmIdProperty, filmId];
    
    NSError *error;
    return [[self.privateContext executeFetchRequest:request error:&error] firstObject];
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
//        _privateContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
//        _privateContext.persistentStoreCoordinator = [CoreDataManager persistenceStoreCordinator];
        _privateContext = [CoreDataManager privateObjectContext];
    }
    return _privateContext;
}

@end
