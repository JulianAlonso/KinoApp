//
//  ExternalTMDBProvider.m
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "ExternalTMDBProvider.h"
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
    NSMutableArray *semiCompletedFilms = [NSMutableArray array];
    for (FilmDTO *f in films)
    {
        __weak typeof(self) weakSelf = self;
        [self fetchFilmById:f.filmId completion:^(FilmDTO *film)
        {
            __strong typeof(weakSelf) strongSelf = weakSelf;
            
            film.filmType = f.filmType;
            [semiCompletedFilms addObject:film];
            if (semiCompletedFilms.count == films.count)
            {
                [strongSelf.filmReleasesProvider fetchFilmReleaseDTOsForFilms:semiCompletedFilms completion:^(NSArray<FilmDTO *> *completedFilms)
                {
                    completion(completedFilms);
                }];
            }
        }];
    }
}

@end
