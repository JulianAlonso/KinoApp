//
//  LocalFilmsProvider.h
//  KinoApp
//
//  Created by Julian Alonso on 17/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class FilmDTO;

@protocol LocalFilmsProvider <NSObject>

- (void)fetchFilmsByFilmType:(NSString *)filmType andCompletion:(void (^)(NSArray *))completionBlock;

- (void)saveFilms:(NSArray *)films completion:(void(^)(NSArray *films))completionBlock;

- (void)fetchFilmById:(NSString *)filmId completion:(void(^)(FilmDTO *film))completion;

- (void)createOrUpdateFilm:(FilmDTO *)film completion:(void(^)(FilmDTO *film))completion;

@end
