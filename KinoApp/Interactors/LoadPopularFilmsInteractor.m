//
//  LoadPopularFilmsInteractor.m
//  KinoApp
//
//  Created by Julian Alonso on 20/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "LoadPopularFilmsInteractor.h"

@implementation LoadPopularFilmsInteractor

- (void)loadPopularFilms:(void(^)(NSArray *films))completion
{
    [self.externalProvider fetchPopularFilms:completion];
}

@end
