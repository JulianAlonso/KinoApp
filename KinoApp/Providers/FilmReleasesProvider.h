//
//  FilmReleasesProvider.h
//  KinoApp
//
//  Created by Julian Alonso on 27/10/15.
//  Copyright © 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FilmReleaseDTO;
@class FilmDTO;

@protocol FilmReleasesProvider <NSObject>

- (void)filmReleaseDTOsForFilmWithId:(NSString *)filmId completion:(void(^)(NSArray<FilmReleaseDTO *> *filmReleaseDTOs))completionBlock;

- (void)fetchFilmReleaseDTOsForFilms:(NSArray<FilmDTO *> *)films completion:(void(^)(NSArray<FilmDTO *> *completedFilms))completionBlock;

@end
