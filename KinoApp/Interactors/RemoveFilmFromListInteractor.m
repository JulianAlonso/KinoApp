//
//  RemoveFilmFromListInteractor.m
//  KinoApp
//
//  Created by Julian Alonso on 25/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "RemoveFilmFromListInteractor.h"

@implementation RemoveFilmFromListInteractor

- (void)removeFilm:(FilmDTO *)film fromList:(ListDTO *)list withCompletion:(void (^)(ListDTO *, NSError *))completion
{
    [self.localListProvider removeFilm:film fromList:list completion:completion];
}

@end
