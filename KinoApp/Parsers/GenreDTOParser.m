//
//  GenreDTOParser.m
//  KinoApp
//
//  Created by Julian Alonso on 26/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "GenreDTOParser.h"
#import "GenreDTO.h"
#import "Genre.h"

NSString *const kGenreIdFromDic = @"id";
NSString *const kGenreNameFomDic = @"name";

@implementation GenreDTOParser

+ (NSArray *)genreDTOsFromArray:(NSArray *)array
{
    NSMutableArray *genres = [NSMutableArray array];
    for (NSDictionary *dictionary in array)
    {
        [genres addObject:[GenreDTOParser genreDTOFromDictionary:dictionary]];
    }
    return genres;
}

+ (GenreDTO *)genreDTOFromDictionary:(NSDictionary *)dictionary
{
    GenreDTO *genre = [GenreDTO new];
    
    genre.genreId = dictionary[kGenreIdFromDic];
    genre.genreName = dictionary[kGenreNameFomDic];
    
    return genre;
}

+ (NSArray *)genreDTOsFromOrderedSetOfGenres:(NSOrderedSet *)genres
{
    NSMutableArray *genreDTOs = [NSMutableArray array];
    
    for (Genre *genre in genres)
    {
        [genreDTOs addObject:[GenreDTOParser genreDTOFromGenre:genre]];
    }
    return genreDTOs;
}

+ (GenreDTO *)genreDTOFromGenre:(Genre *)genre
{
    GenreDTO *genreDTO = [GenreDTO new];
    
    genreDTO.genreId = genre.genreId;
    genreDTO.genreName = genre.genreName;
    
    return genreDTO;
}

@end
