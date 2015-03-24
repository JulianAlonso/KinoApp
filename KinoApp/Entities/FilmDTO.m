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

@end
