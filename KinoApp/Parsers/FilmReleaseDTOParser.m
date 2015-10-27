//
//  FilmReleaseDTOParser.m
//  KinoApp
//
//  Created by Julian Alonso on 27/10/15.
//  Copyright © 2015 Julian. All rights reserved.
//

#import "FilmReleaseDTOParser.h"
#import "FilmReleaseDTO.h"
#import "DateHelper.h"

static NSString *const dReleaseCertification = @"certification";
static NSString *const dReleaseCountryISO = @"iso_3166_1";
static NSString *const dReleaseDate = @"release_date";

@implementation FilmReleaseDTOParser

+ (NSArray<FilmReleaseDTO *> *)filmReleaseDTOsFromArray:(NSArray *)dictionaries
{
    NSMutableArray *filmReleases = [NSMutableArray array];
    
    for (NSDictionary *dic in dictionaries)
    {
        [filmReleases addObject:[FilmReleaseDTOParser filmReleaseDTOfromDictionary:dic]];
    }
    
    return filmReleases;
}

+ (FilmReleaseDTO *)filmReleaseDTOfromDictionary:(NSDictionary *)dictionary
{
    FilmReleaseDTO *filmReleaseDTO = [FilmReleaseDTO new];
    
    filmReleaseDTO.releaseCertification = dictionary[dReleaseCertification];
    filmReleaseDTO.releaseCountryISO = dictionary[dReleaseCountryISO];
    filmReleaseDTO.releaseDate = [DateHelper dateFromString:dictionary[dReleaseDate] withFormat:TMDB_DATE_FORMAT];
    
    return filmReleaseDTO;
}

@end
