//
//  FilmDTOParser.h
//  KinoApp
//
//  Created by Julian Alonso on 17/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Film.h"

@class FilmDTO;

@interface FilmDTOParser : NSObject

+ (FilmDTO *)filmDTOFromDictionary:(NSDictionary *)dictionary filmType:(NSString *)filmType;
+ (NSArray *)filmDTOsFromArray:(NSArray *)array filmsType:(NSString *)filmsTipye;

+ (FilmDTO *)filmDTOFromFilm:(Film *)film;
+ (NSArray *)filmDTOsFromFilmsArray:(NSArray *)array;

+ (NSSet *)filmDTOsFromFilmsSet:(NSSet *)set;

@end
