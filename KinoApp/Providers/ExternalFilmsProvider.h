//
//  ExternalFilmsProvider.h
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FilmDTO;

@protocol ExternalFilmsProvider <NSObject>

- (void)fetchUpcomingFilms:(void(^)(NSArray *films))completion;

- (void)fetchPlayingNowFilms:(void(^)(NSArray *films))completion;

- (void)fetchFilmById:(NSString *)filmId completion:(void(^)(FilmDTO *film))completion;

- (void)fetchPopularFilms:(void(^)(NSArray *films))completion;

- (void)searchFilm:(NSString *)text completion:(void(^)(NSArray *films))completion;

@end
