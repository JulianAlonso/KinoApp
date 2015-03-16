//
//  ExternalTMDBProvider.m
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "ExternalTMDBProvider.h"

@implementation ExternalTMDBProvider

- (void)fetchUpcomingFilms:(void (^)(NSArray *))completion
{
    NSLog(@"Fetching upcoming films");
}

- (void)fetchPlayingNowFilms:(void (^)(NSArray *))completion
{
    NSLog(@"Fetching playing now films");
}

@end
