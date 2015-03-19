//
//  AddFilmToListInteractor.h
//  KinoApp
//
//  Created by Julian Alonso on 19/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LocalListsProvider.h"

@class FilmDTO;
@class ListDTO;

@interface AddFilmToListInteractor : NSObject

@property (nonatomic, strong) id<LocalListsProvider> localProvider;

- (void)addFilm:(FilmDTO *)film toList:(ListDTO *)list completion:(void (^)(NSError *error))completion;

@end
