//
//  Film+Model.m
//  KinoApp
//
//  Created by Julian Alonso on 17/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "Film+Model.h"
#import "FilmDTO.h"
#import "GenreDTO.h"
#import "Genre+Model.h"
#import "FilmRelease.h"

NSString *const kFilmIdProperty = @"filmId";
NSString *const kFilmTypeProperty = @"filmType";
NSString *const kFilmReleaseDateProperty = @"filmReleaseDate";

@implementation Film (Model)

+ (instancetype)filmWithFilmDTO:(FilmDTO *)filmDTO andManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    Film *film = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([self class]) inManagedObjectContext:managedObjectContext];
    
    if (film)
    {
        film.filmTitle = filmDTO.filmTitle;
        film.filmTagline = filmDTO.filmTagline;
        film.filmReleaseDate = filmDTO.filmReleaseDate;
        film.filmPosterPath = filmDTO.filmPosterPath;
        film.filmOverview = filmDTO.filmOverview;
        film.filmOriginalTitle = filmDTO.filmOriginalTitle;
        film.filmId = [NSString stringWithFormat:@"%@", filmDTO.filmId];
        film.filmBackdropPath = filmDTO.filmBackdropPath;
        film.filmHomepage = filmDTO.filmHomepage;
        film.filmType = filmDTO.filmType;
        film.filmRuntime = filmDTO.filmRuntime;
        
        for (GenreDTO *genreDTO in filmDTO.filmGenres)
        {
            Genre *genre = [Genre genreWithGenreDTO:genreDTO andManagedObjectContext:managedObjectContext];
            [film addFilmGenresObject:genre];
        }
        
        [filmDTO.filmReseases enumerateObjectsUsingBlock:^(FilmReleaseDTO * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
        {
            FilmRelease *filmRelease = [FilmRelease filmReleaseWithFilmReleaseDTO:obj andManagedObjectContext:managedObjectContext];
            [film addFilmReleasesObject:filmRelease];
        }];
    }
    
    return film;
}

#pragma mark - Override methods.
- (void)addFilmGenresObject:(Genre *)value
{
    NSMutableOrderedSet *tempSet = [NSMutableOrderedSet orderedSetWithOrderedSet:self.filmGenres];
    [tempSet addObject:value];
    self.filmGenres = tempSet;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Name: %@", self.filmTitle];
}

@end
