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

@end

@implementation LocalCoreDataFilmsProvider

#pragma mark - LocalFilmsProvider methods.
- (void)saveFilms:(NSArray *)films completion:(void(^)(NSArray *films))completionBlock
{
    for (FilmDTO *f in films)
    {
        NSFetchRequest *select = [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass([Film class])];
        select.predicate = [NSPredicate predicateWithFormat:@"%K == %@", kFilmIdProperty, f.filmId];
        
        NSError *error;
        __unused Film *film = [[self.privateContext executeFetchRequest:select error:&error] firstObject];
        
        if (!film)
        {
            film = [Film filmWithFilmDTO:f andManagedObjectContext:self.privateContext];
        }
    }
    [self.privateContext save:nil];
    
    [self fetchFilmsByFilmType:[[films lastObject] valueForKey:kFilmTypeProperty]  andCompletion:^(NSArray *fetchedFilms) {
        
        NSMutableArray *toRemove = [NSMutableArray array];
        for (FilmDTO *film in fetchedFilms)
        {
            if (![films containsObject:film])
            {
                [toRemove addObject:film];
            }
        }
        
        for (FilmDTO *film in toRemove)
        {
            [self deleteFilm:film];
        }
        
        [self fetchFilmsByFilmType:[[films lastObject] valueForKey:kFilmTypeProperty] andCompletion:^(NSArray *foundFilms) {
            completionBlock(foundFilms);
        }];
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

- (void)fetchFilmById:(NSString *)filmId completion:(void (^)(FilmDTO *))completion
{
    NSFetchRequest *select = [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass([Film class])];
    select.predicate = [NSPredicate predicateWithFormat:@"%K == %@", kFilmIdProperty, filmId];
    
    NSError *error;
    Film *film = [[self.privateContext executeFetchRequest:select error:&error] firstObject];
    
    if (film)
    {
        completion([FilmDTOParser filmDTOFromFilm:film]);
    }
    else
    {
        completion(nil);
    }
}

- (void)createOrUpdateFilm:(FilmDTO *)film completion:(void(^)(FilmDTO *film))completion
{
    NSFetchRequest *select = [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass([Film class])];
    select.predicate = [NSPredicate predicateWithFormat:@"%K == %@", kFilmIdProperty, film.filmId];
    
    NSError *error;
    Film *filmMO = [[self.privateContext executeFetchRequest:select error:&error] firstObject];
    
    if (filmMO)
    {
        filmMO.filmTagline = film.filmTagline;
        filmMO.filmHomepage = film.filmHomepage;
        filmMO.filmOverview = film.filmOverview;
        
        [self.privateContext save:nil];
    }
    else
    {
        #pragma unused(filmMO)
        filmMO = [Film filmWithFilmDTO:film andManagedObjectContext:self.privateContext];
        [self.privateContext save:nil];
    }
    
    completion(film);
}

#pragma mark - Own methods.
- (void)deleteFilm:(FilmDTO *)film
{
    NSFetchRequest *select = [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass([Film class])];
    select.predicate = [NSPredicate predicateWithFormat:@"%K == %@", kFilmIdProperty, film.filmId];
    
    NSError *error;
    Film *foundFilm = [[self.privateContext executeFetchRequest:select error:&error] firstObject];
    
    if (foundFilm)
    {
        if ([[foundFilm filmLists] count] == 0)
        {
            [self.privateContext deleteObject:foundFilm];
        }
        else
        {
            foundFilm.filmType = TYPE_OLD;
            [self.privateContext save:nil];
        }
    }
}

#pragma mark - Lazy getters.
- (NSManagedObjectContext *)privateContext
{
    if (!_privateContext)
    {
        _privateContext = [CoreDataManager privateObjectContext];
    }
    return _privateContext;
}

@end
