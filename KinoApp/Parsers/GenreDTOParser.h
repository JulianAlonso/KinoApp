//
//  GenreDTOParser.h
//  KinoApp
//
//  Created by Julian Alonso on 26/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GenreDTO;
@class Genre;

@interface GenreDTOParser : NSObject

+ (NSArray *)genreDTOsFromArray:(NSArray *)array;

+ (GenreDTO *)genreDTOFromDictionary:(NSDictionary *)dictionary;

+ (NSArray *)genreDTOsFromOrderedSetOfGenres:(NSOrderedSet *)genres;

+ (GenreDTO *)genreDTOFromGenre:(Genre *)genre;

@end
