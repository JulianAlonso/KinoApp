//
//  FilmDTOParser.m
//  KinoApp
//
//  Created by Julian Alonso on 17/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "FilmDTOParser.h"
#import "FilmDTO.h"

NSString *const dFilmId = @"id";
NSString *const dFilmTitle = @"title";
NSString *const dFilmOriginalTitle = @"original_title";
NSString *const dFilmReleaseDate = @"release_date";
NSString *const dFilmHomepage = @"homepage";
NSString *const dFilmOverview = @"overview";
NSString *const dFilmTagline = @"tagline";
NSString *const dFilmPosterPath = @"poster_path";
NSString *const dFilmBackdropPath = @"backdrop_path";

@implementation FilmDTOParser

+ (FilmDTO *)filmDTOFromDictionary:(NSDictionary *)dictionary
{
    FilmDTO *film = [FilmDTO new];
    
    film.filmId = dictionary[dFilmId];
    film.filmTitle = dictionary[dFilmTitle];
    film.filmOriginalTitle = dictionary[dFilmOriginalTitle];
    film.filmReleaseDate = dictionary[dFilmReleaseDate];
    film.filmHomepage = dictionary[dFilmHomepage];
    film.filmOverView = dictionary[dFilmOverview];
    film.filmTagline = dictionary[dFilmTagline];
    film.filmPosterPath = dictionary[dFilmPosterPath];
    film.filmBackdropPath = dictionary[dFilmBackdropPath];
    
    return film;
}

+ (NSArray *)filmDTOsFromArray:(NSArray *)array
{
    NSMutableArray *films = [NSMutableArray array];
    for (NSDictionary *filmDictionary in array)
    {
        [films addObject:[FilmDTOParser filmDTOFromDictionary:filmDictionary]];
    }
    return films;
}

@end
