//
//  FilmDTO.m
//  KinoApp
//
//  Created by Julian Alonso on 17/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "FilmDTO.h"
#import "DateHelper.h"

NSString *const TYPE_PLAYIN_NOW = @"playing now";
NSString *const TYPE_UPCOMING = @"upcoming";
NSString *const TYPE_OLD = @"old";
NSString *const kPosterPathProperty = @"filmPosterPath";

@implementation FilmDTO

- (NSString *)filmYear
{
    return [DateHelper yearStirngFromDate:self.filmReleaseDate];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"id: %@ \n original title: %@ \n title: %@ \n release date: %@ \n homepage: %@ \n overview: %@ \n tagline: %@ \n poster path: %@ \n backdrop path: %@ \n type: %@ \n runtime: %@ \n genres: %@ \n year: %@ \n release dates: %@ \n", self.filmId, self.filmOriginalTitle, self.filmTitle, self.filmReleaseDate, self.filmHomepage, self.filmOverview, self.filmTagline, self.filmPosterPath, self.filmBackdropPath, self.filmType, self.filmRuntime, self.filmGenres, self.filmYear, self.filmReseases];
}

#pragma mark - Equals methods.
- (BOOL)isEqual:(id)object
{
    if (self == object)
    {
        return YES;
    }
    
    if (![object isKindOfClass:[FilmDTO class]])
    {
        return NO;
    }
    
    return [self isEqualToFilmDTO:object];
}

- (BOOL)isEqualToFilmDTO:(FilmDTO *)film
{
    if (!film)
    {
        return NO;
    }
    
    return [self.filmId isEqualToString:film.filmId];
}

@end
