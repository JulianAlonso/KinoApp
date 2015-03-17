//
//  Film+Model.m
//  KinoApp
//
//  Created by Julian Alonso on 17/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "Film+Model.h"
#import "FilmDTO.h"

NSString *const kFilmTypeProperty = @"filmType";

@implementation Film (Model)

+ (instancetype)initWithFilmDTO:(FilmDTO *)filmDTO andManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
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
    }
    
    return film;
}

@end
