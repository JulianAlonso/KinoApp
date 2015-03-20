//
//  SearchFilmInteractor.m
//  KinoApp
//
//  Created by Julian Alonso on 20/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "SearchFilmInteractor.h"

@implementation SearchFilmInteractor

- (void)searchFilm:(NSString *)text completion:(void(^)(NSArray *films))completion
{
    [self.externalProvider searchFilm:text completion:completion];
}

@end
