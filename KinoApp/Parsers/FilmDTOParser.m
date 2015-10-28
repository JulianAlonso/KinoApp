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
#import "DateHelper.h"
#import "FilmReleaseDTOParser.h"

static NSString *const dFilmId = @"id";
static NSString *const dFilmTitle = @"title";
static NSString *const dFilmOriginalTitle = @"original_title";
static NSString *const dFilmReleaseDate = @"release_date";
static NSString *const dFilmHomepage = @"homepage";
static NSString *const dFilmOverview = @"overview";
static NSString *const dFilmTagline = @"tagline";
static NSString *const dFilmPosterPath = @"poster_path";
static NSString *const dFilmBackdropPath = @"backdrop_path";
static NSString *const dFilmRuntime = @"runtime";
static NSString *const dFilmGenres = @"genres";

@implementation FilmDTOParser

+ (FilmDTO *)filmDTOFromDictionary:(NSDictionary *)dictionary filmType:(NSString *)filmType
{
    FilmDTO *film = [FilmDTO new];
    
    film.filmId = [NSString stringWithFormat:@"%@", dictionary[dFilmId]];
    film.filmTitle = [NSString stringWithFormat:@"%@", dictionary[dFilmTitle]];
    film.filmOriginalTitle = [NSString stringWithFormat:@"%@", dictionary[dFilmOriginalTitle]];
    film.filmReleaseDate = [DateHelper dateFromString:[NSString stringWithFormat:@"%@", dictionary[dFilmReleaseDate]]
                                           withFormat:TMDB_DATE_FORMAT];
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
    
    if (film.filmReleases.count > 0)
    {
        filmDTO.filmReseases = [FilmReleaseDTOParser filmReleaseDTOsFromFilmReleases:film.filmReleases];
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
