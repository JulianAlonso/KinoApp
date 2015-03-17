//
//  FilmDTOParser.h
//  KinoApp
//
//  Created by Julian Alonso on 17/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FilmDTO;

@interface FilmDTOParser : NSObject

+ (FilmDTO *)filmDTOFromDictionary:(NSDictionary *)dictionary;
+ (NSArray *)filmDTOsFromArray:(NSArray *)array;

@end
