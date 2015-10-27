//
//  FilmReleaseDateDTO.m
//  KinoApp
//
//  Created by Julian Alonso on 27/10/15.
//  Copyright © 2015 Julian. All rights reserved.
//

#import "FilmReleaseDTO.h"

@implementation FilmReleaseDTO

- (NSString *)description
{
    return [NSString stringWithFormat:@"Release Date = %@ \n Country = %@", self.releaseDate, self.releaseCountryISO];
}

@end
