//
//  FilmReleasesProviderImpl.m
//  KinoApp
//
//  Created by Julian Alonso on 27/10/15.
//  Copyright © 2015 Julian. All rights reserved.
//

#import "TMDBFilmReleasesProvider.h"
#import "APIVars.h"
#import "FilmReleaseDTOParser.h"
#import "FilmDTO.h"

static NSString *dCountries = @"countries";

@implementation TMDBFilmReleasesProvider

- (void)filmReleaseDTOsForFilmWithId:(NSString *)filmId completion:(void (^)(NSArray<FilmReleaseDTO *> *))completionBlock
{
    NSString *endpoint = [NSString stringWithFormat:FILM_RELEASE_DATE_ENDPOINT, filmId];
    
    [self.requestManager GETendpoint:endpoint params:nil andCompletionBlock:^(NSData *data)
    {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        
        completionBlock([FilmReleaseDTOParser filmReleaseDTOsFromArray:dic[dCountries]]);
    }];
}

- (void)fetchFilmReleaseDTOsForFilms:(NSArray<FilmDTO *> *)films completion:(void(^)(NSArray<FilmDTO *> *completedFilms))completionBlock
{
    NSMutableArray *completedFilms = [NSMutableArray array];
    
    for (FilmDTO *film in films)
    {
        [self filmReleaseDTOsForFilmWithId:film.filmId completion:^(NSArray<FilmReleaseDTO *> *filmReleaseDTOs)
        {
            film.filmReseases = filmReleaseDTOs;
            [completedFilms addObject:film];
            
            if (completedFilms.count == films.count)
            {
                completionBlock(completedFilms);
            }
        }];
    }
}

@end
