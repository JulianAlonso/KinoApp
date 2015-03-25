//
//  FilmFilter.m
//  KinoApp
//
//  Created by Julian Alonso on 25/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "FilmFilter.h"
#import "FilmDTO.h"

@implementation FilmFilter

+ (NSArray *)filterInvalidFilms:(NSArray *)films
{
    NSMutableArray *validatedFilms = [NSMutableArray array];
    for (FilmDTO *film in films)
    {
        if ([FilmFilter checkValidFilm:film])
        {
            [validatedFilms addObject:film];
        }
    }
    return validatedFilms;
}

+ (BOOL)checkValidFilm:(FilmDTO *)film
{
    if ([film.filmOverview isEqualToString:@"(null)"] || [film.filmOverview isEqualToString:@"<null>"]
        || !film.filmOverview || [film.filmOverview isEqualToString:@""])
    {
        return NO;
    }
    

    
    return YES;
}

@end
