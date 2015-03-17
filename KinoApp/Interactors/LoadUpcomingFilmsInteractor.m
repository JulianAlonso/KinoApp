//
//  LoadUpcomingFilmsInteractor.m
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "LoadUpcomingFilmsInteractor.h"

@implementation LoadUpcomingFilmsInteractor

#pragma mark - BillboardFilmsInteractor methods.
- (void)fetchFilmsWithComplectionBlock:(void (^)(NSArray *))completionBlock
{
    [self loadUpcomingFilms:completionBlock];
}

#pragma mark - Own methods.
- (void)loadUpcomingFilms:(CompletionBlock)completionBlock
{
    [self.externalProvider fetchUpcomingFilms:^(NSArray *films) {
        //Save to coredata
    }];
    //Read from coredata:
    completionBlock(nil);
}

@end
