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
#import "NSDictionary+Utilities.h"

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
static NSString *const dFilmVotes = @"vote_count";
static NSString *const dFilmVotesAverage = @"vote_average";

@implementation FilmDTOParser

+ (FilmDTO *)filmDTOFromDictionary:(NSDictionary *)dictionary filmType:(NSString *)filmType
{
    FilmDTO *film = [FilmDTO new];
    
    film.filmId = [dictionary stringWithKey:dFilmId];
    film.filmTitle = [dictionary stringWithKey:dFilmTitle];
    film.filmOriginalTitle = [dictionary stringWithKey:dFilmOriginalTitle];
    film.filmReleaseDate = [DateHelper dateFromString:[NSString stringWithFormat:@"%@", dictionary[dFilmReleaseDate]]
                                           withFormat:TMDB_DATE_FORMAT];
    film.filmHomepage = [dictionary stringWithKey:dFilmHomepage];
    film.filmOverview = [dictionary stringWithKey:dFilmOverview];
    film.filmTagline = [dictionary stringWithKey:dFilmTagline];
    film.filmRuntime = [dictionary stringWithKey:dFilmRuntime];
    film.filmPosterPath = [URLHelper imageUrlWithEndpoint:dictionary[dFilmPosterPath]];
    film.filmBackdropPath = [URLHelper imageUrlWithEndpoint:dictionary[dFilmBackdropPath]];
    film.filmVotes = @([dictionary[dFilmVotes] integerValue]);
    film.filmVotesAverage = @([dictionary[dFilmVotesAverage] integerValue]);
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
    filmDTO.filmVotesAverage = film.filmVoteAverage;
    filmDTO.filmVotes = film.filmVotes;
    
    if (film.filmGenres.count > 0)
    {
        filmDTO.filmGenres = [GenreDTOParser genreDTOsFromOrderedSetOfGenres:film.filmGenres];
    }
    
    if (film.filmReleases.count > 0)
    {
        filmDTO.filmReseases = [FilmReleaseDTOParser filmReleaseDTOsFromFilmReleases:film.filmReleases.allObjects];
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
