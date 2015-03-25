//
//  RemoveFilmFromListInteractor.h
//  KinoApp
//
//  Created by Julian Alonso on 25/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LocalListsProvider.h"

@class FilmDTO;
@class ListDTO;

@interface RemoveFilmFromListInteractor : NSObject

@property (nonatomic, strong) id<LocalListsProvider> localListProvider;

- (void)removeFilm:(FilmDTO *)film fromList:(ListDTO *)list withCompletion:(void(^)(ListDTO *list, NSError *error))completion;

@end
