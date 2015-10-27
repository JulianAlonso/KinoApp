//
//  FilmReleasesProvider.h
//  KinoApp
//
//  Created by Julian Alonso on 27/10/15.
//  Copyright © 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FilmReleaseDTO;

@protocol FilmReleasesProvider <NSObject>

- (NSArray<FilmReleaseDTO *> *)filmReleaseDTOsForFilmWithId:(NSString *)filmId;

@end
