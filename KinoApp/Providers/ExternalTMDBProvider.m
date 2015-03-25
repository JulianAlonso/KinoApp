//
//  ExternalTMDBProvider.m
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "ExternalTMDBProvider.h"
#import "RequestManagerFactory.h"
#import "APIVars.h"
#import "FilmDTOParser.h"
#import "FilmDTO.h"
#import "FilmFilter.h"

@implementation ExternalTMDBProvider

- (void)fetchUpcomingFilms:(void (^)(NSArray *))completion
{
    [self.requestManager GETendpoint:UPCOMING_ENDPOINT params:nil andCompletionBlock:^(NSData *data) {
        NSError *error;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        NSArray *films = [FilmDTOParser filmDTOsFromArray:dic[@"results"] filmsType:TYPE_UPCOMING];
        
        [self completeFilmsFields:films completion:^(NSArray *completedFilms) {
            completion([FilmFilter filterInvalidFilms:completedFilms]);
        }];
    }];
}

- (void)fetchPlayingNowFilms:(void (^)(NSArray *))completion
{
    [self.requestManager GETendpoint:NOW_PLAYING_ENDPOINT params:nil andCompletionBlock:^(NSData *data) {
        NSError *error;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        NSArray *films = [FilmDTOParser filmDTOsFromArray:dic[@"results"] filmsType:TYPE_PLAYIN_NOW];
        
        [self completeFilmsFields:films completion:^(NSArray *completedFilms) {
            completion([FilmFilter filterInvalidFilms:completedFilms]);
        }];
    }];
}

- (void)fetchFilmById:(NSString *)filmId completion:(void (^)(FilmDTO *))completion
{
    NSString *movieEndpoint = [NSString stringWithFormat:@"%@%@", BY_ID_ENDPOINT, filmId];
    [self.requestManager GETendpoint:movieEndpoint params:nil andCompletionBlock:^(NSData *data) {
        NSError *error;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        completion([FilmDTOParser filmDTOFromDictionary:dic filmType:nil]);
    }];
}

- (void)fetchPopularFilms:(void (^)(NSArray *))completion
{
    [self.requestManager GETendpoint:POPULAR_ENDPOINT params:nil andCompletionBlock:^(NSData *data) {
        NSError *error;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        completion([FilmDTOParser filmDTOsFromArray:dic[@"results"] filmsType:nil]);
    }];
}

- (void)searchFilm:(NSString *)text completion:(void(^)(NSArray *films))completion
{
    [self.requestManager GETendpoint:SEARCH_ENDPOINT params:@{@"query" : text} andCompletionBlock:^(NSData *data) {
        if (data)
        {
            NSError *error;
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
            completion([FilmDTOParser filmDTOsFromArray:dic[@"results"] filmsType:nil]);
        }
    }];
}

- (void)completeFilmsFields:(NSArray *)films completion:(void(^)(NSArray *completedFilms))completion
{
    NSMutableArray *completedFilms = [NSMutableArray array];
    for (FilmDTO *f in films)
    {
        [self fetchFilmById:f.filmId completion:^(FilmDTO *film) {
            film.filmType = f.filmType;
            [completedFilms addObject:film];
            if (completedFilms.count == films.count)
            {
                completion(completedFilms);
            }
        }];
    }
}

#pragma mark - Lazy getterss.
- (id<RequestManager>)requestManager
{
    if (!_requestManager)
    {
        _requestManager = [RequestManagerFactory requestManager];
    }
    return _requestManager;
}

@end
