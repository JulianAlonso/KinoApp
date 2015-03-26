    //
//  FilmDTOParser.m
//  KinoApp
//
//  Created by Julian Alonso on 17/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "FilmDTOParser.h"
#import "FilmDTO.h"
#import "URLHelper.h"
#import "GenreDTOParser.h"

NSString *const dFilmId = @"id";
NSString *const dFilmTitle = @"title";
NSString *const dFilmOriginalTitle = @"original_title";
NSString *const dFilmReleaseDate = @"release_date";
NSString *const dFilmHomepage = @"homepage";
NSString *const dFilmOverview = @"overview";
NSString *const dFilmTagline = @"tagline";
NSString *const dFilmPosterPath = @"poster_path";
NSString *const dFilmBackdropPath = @"backdrop_path";
NSString *const dFilmRuntime = @"runtime";
NSString *const dFilmGenres = @"genres";

@implementation FilmDTOParser

+ (FilmDTO *)filmDTOFromDictionary:(NSDictionary *)dictionary filmType:(NSString *)filmType
{
    FilmDTO *film = [FilmDTO new];
    
    film.filmId = [NSString stringWithFormat:@"%@", dictionary[dFilmId]];
    film.filmTitle = [NSString stringWithFormat:@"%@", dictionary[dFilmTitle]];
    film.filmOriginalTitle = [NSString stringWithFormat:@"%@", dictionary[dFilmOriginalTitle]];
    film.filmReleaseDate = [NSString stringWithFormat:@"%@", dictionary[dFilmReleaseDate]];
    film.filmHomepage = [NSString stringWithFormat:@"%@", dictionary[dFilmHomepage]];
    film.filmOverview = [NSString stringWithFormat:@"%@", dictionary[dFilmOverview]];
    film.filmTagline = [NSString stringWithFormat:@"%@", dictionary[dFilmTagline]];
    film.filmRuntime = [NSString stringWithFormat:@"%@", dictionary[dFilmRuntime]];
    film.filmPosterPath = [URLHelper imageUrlWithEndpoint:dictionary[dFilmPosterPath]];
    film.filmBackdropPath = [URLHelper imageUrlWithEndpoint:dictionary[dFilmBackdropPath]];
    filmType ? film.filmType = filmType : film.filmType;
    
    NSArray *genresDic = dictionary[dFilmGenres];
    if (genresDic)
    {
        film.filmGenres = [GenreDTOParser genreDTOsFromArray:genresDic];
    }
    
    return film;
}

+ (NSArray *)filmDTOsFromArray:(NSArray *)array filmsType:(NSString *)filmsTipye
{
    NSMutableArray *films = [NSMutableArray array];
    for (NSDictionary *filmDictionary in array)
    {
        [films addObject:[FilmDTOParser filmDTOFromDictionary:filmDictionary filmType:filmsTipye]];
    }
    return films;
}


+ (FilmDTO *)filmDTOFromFilm:(Film *)film
{
    FilmDTO *filmDTO = [FilmDTO new];
    
    filmDTO.filmId = film.filmId;
    filmDTO.filmTitle = film.filmTitle;
    filmDTO.filmOriginalTitle = film.filmOriginalTitle;
    filmDTO.filmReleaseDate = film.filmReleaseDate;
    filmDTO.filmHomepage = film.filmHomepage;
    filmDTO.filmOverview = film.filmOverview;
    filmDTO.filmTagline = film.filmTagline;
    filmDTO.filmPosterPath = film.filmPosterPath;
    filmDTO.filmBackdropPath = film.filmBackdropPath;
    filmDTO.filmType = film.filmType;
    filmDTO.filmRuntime = film.filmRuntime;
    
    if (film.filmGenres.count > 0)
    {
        filmDTO.filmGenres = [GenreDTOParser genreDTOsFromOrderedSetOfGenres:film.filmGenres];
    }
    
    return filmDTO;
}

+ (NSArray *)filmDTOsFromFilmsArray:(NSArray *)array
{
    NSMutableArray *filmDTOs = [NSMutableArray array];
	for (Film *film in array)
    {
        [filmDTOs addObject:[FilmDTOParser filmDTOFromFilm:film]];
    }
    return filmDTOs;
}

+ (NSArray *)filmDTOsFromFilmsSet:(NSSet *)set
{
    NSMutableArray *resultArray = [NSMutableArray array];
    for (Film *film in set)
    {
        [resultArray addObject:[FilmDTOParser filmDTOFromFilm:film]];
    }
    return resultArray;
}

@end
