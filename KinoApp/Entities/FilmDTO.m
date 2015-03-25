//
//  FilmDTO.m
//  KinoApp
//
//  Created by Julian Alonso on 17/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "FilmDTO.h"

NSString *const TYPE_PLAYIN_NOW = @"playing now";
NSString *const TYPE_UPCOMING = @"upcoming";

NSString *const kPosterPathProperty = @"filmPosterPath";

@implementation FilmDTO

- (NSString *)filmYear
{
    return [[self.filmReleaseDate componentsSeparatedByString:@"-"] firstObject];
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
