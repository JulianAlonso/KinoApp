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

@implementation ExternalTMDBProvider

- (void)fetchUpcomingFilms:(void (^)(NSArray *))completion
{
    [self.requestManager GETendpoint:UPCOMING_ENDPOINT params:nil andCompletionBlock:^(NSData *data) {
        NSError *error;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        completion([FilmDTOParser filmDTOsFromArray:dic[@"results"] filmsType:TYPE_UPCOMING]);
    }];
}

- (void)fetchPlayingNowFilms:(void (^)(NSArray *))completion
{
    [self.requestManager GETendpoint:NOW_PLAYING_ENDPOINT params:nil andCompletionBlock:^(NSData *data) {
        NSError *error;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        completion([FilmDTOParser filmDTOsFromArray:dic[@"results"] filmsType:TYPE_PLAYIN_NOW]);
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
