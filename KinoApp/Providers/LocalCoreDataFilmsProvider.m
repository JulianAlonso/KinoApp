//
//  LocalCoreDataProvider.m
//  KinoApp
//
//  Created by Julian Alonso on 17/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "LocalCoreDataFilmsProvider.h"
#import "CoreDataManager.h"
#import "FilmDTO.h"
#import "Film+Model.h"
#import "FilmDTOParser.h"


@interface LocalCoreDataFilmsProvider ()

@property (nonatomic, strong) NSManagedObjectContext *privateContext;

@property (nonatomic, copy) void(^updatedBlock)(NSArray *films);
@property (nonatomic, strong) NSString *lastFilmType;

@end

@implementation LocalCoreDataFilmsProvider

#pragma mark - LocalFilmsProvider methods.
- (void)saveFilms:(NSArray *)films completion:(void(^)(NSArray *films))completionBlock
{
    [self registerToUpdate];
    self.updatedBlock = completionBlock;
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
        Film *film;
        for (FilmDTO *filmDTO in films)
        {
            film = [Film initWithFilmDTO:filmDTO andManagedObjectContext:self.privateContext];
        }
        self.lastFilmType = film.filmType;
        [strongSelf.privateContext save:nil];
    });
}

- (void)fetchFilmsByFilmType:(NSString *)filmType andCompletion:(void (^)(NSArray *))completionBlock
{
    NSFetchRequest *select = [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass([Film class])];
    select.predicate = [NSPredicate predicateWithFormat:@"%K == %@", kFilmTypeProperty, filmType];
    
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
        NSError *error;
        NSArray *films = [strongSelf.privateContext executeFetchRequest:select error:&error];
        
        completionBlock([FilmDTOParser filmDTOsFromFilmsArray:films]);
    });
}

#pragma mark - Own methods.
- (void)registerToUpdate
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(executeUpdateblock)
                                                 name:NSManagedObjectContextDidSaveNotification
                                               object:self.privateContext];
}
- (void)executeUpdateblock
{
    [self fetchFilmsByFilmType:self.lastFilmType andCompletion:self.updatedBlock];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSManagedObjectContextDidSaveNotification object:self.privateContext];
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
