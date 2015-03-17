//
//  Film+Model.m
//  KinoApp
//
//  Created by Julian Alonso on 17/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "Film+Model.h"
#import "FilmDTO.h"


@implementation Film (Model)

- (instancetype)initWithFilmDTO:(FilmDTO *)film andManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    self = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([self class]) inManagedObjectContext:managedObjectContext];
    
    if (self)
    {
        self.filmTitle = film.filmTitle;
        self.filmTagline = film.filmTagline;
        self.filmReleaseDate = film.filmReleaseDate;
        self.filmPosterPath = film.filmPosterPath;
        self.filmOverview = film.filmOverview;
        self.filmOriginalTitle = film.filmOriginalTitle;
        self.filmId = film.filmId;
        self.filmBackdropPath = film.filmBackdropPath;
        self.filmHomepage = film.filmHomepage;
    }
    
    return self;
}

@end
