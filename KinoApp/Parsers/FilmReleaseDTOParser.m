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
#import "FilmRelease.h"

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

+ (FilmReleaseDTO *)filmReleaseDTOfromFilmRelease:(FilmRelease *)filmRelease
{
    FilmReleaseDTO *filmReleaseDTO = [FilmReleaseDTO new];
    
    filmReleaseDTO.releaseCertification = filmRelease.releaseCertification;
    filmReleaseDTO.releaseCountryISO = filmRelease.releaseCountryISO;
    filmReleaseDTO.releaseDate = filmRelease.releaseDate;
    
    return filmReleaseDTO;
}

+ (NSArray<FilmReleaseDTO *> *)filmReleaseDTOsFromFilmReleases:(NSArray<FilmRelease *> *)filmReleases
{
    NSMutableArray *filmReleasesDTOs = [NSMutableArray array];
    
    [filmReleases enumerateObjectsUsingBlock:^(FilmRelease * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
    {
        [filmReleasesDTOs addObject:[FilmReleaseDTOParser filmReleaseDTOfromFilmRelease:obj]];
    }];
    
    return filmReleasesDTOs;
}



@end
