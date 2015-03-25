//
//  AddFilmToListInteractor.m
//  KinoApp
//
//  Created by Julian Alonso on 19/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "AddFilmToListInteractor.h"

@implementation AddFilmToListInteractor

- (void)addFilm:(FilmDTO *)film toList:(ListDTO *)list completion:(void (^)(ListDTO *, NSError *))completion
{
    [self.localProvider addFilm:film toList:list completion:completion];
}

@end
