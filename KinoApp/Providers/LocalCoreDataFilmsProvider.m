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
    [self deleteFilmsByFilmType:[[films firstObject] valueForKey:kFilmTypeProperty] andCompletion:^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
        Film *film;
        for (FilmDTO *filmDTO in films)
        {
            film = [Film initWithFilmDTO:filmDTO andManagedObjectContext:strongSelf.privateContext];
        }
        
        strongSelf.lastFilmType = film.filmType;
        [strongSelf.privateContext save:nil];
    }];
}

- (void)fetchFilmsByFilmType:(NSString *)filmType andCompletion:(void (^)(NSArray *films))completionBlock
{
    NSFetchRequest *select = [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass([Film class])];
    select.predicate = [NSPredicate predicateWithFormat:@"%K == %@", kFilmTypeProperty, filmType];
    select.sortDescriptors = @[[[NSSortDescriptor alloc] initWithKey:@"filmOriginalTitle" ascending:YES]];
    
    NSError *error;
    NSArray *films = [self.privateContext executeFetchRequest:select error:&error];
    
    completionBlock([FilmDTOParser filmDTOsFromFilmsArray:films]);
}

#pragma mark - Own methods.
- (void)deleteFilmsByFilmType:(NSString *)filmType andCompletion:(void (^)())completionBlock
{
    NSFetchRequest *select = [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass([Film class])];
    select.predicate = [NSPredicate predicateWithFormat:@"%K == %@", kFilmTypeProperty, filmType];
    
    NSError *error;
    NSArray *films = [self.privateContext executeFetchRequest:select error:&error];
    if (!error)
    {
        for (Film *film in films)
        {
            [self.privateContext deleteObject:film];
        }
        
        completionBlock();
    }
}

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
