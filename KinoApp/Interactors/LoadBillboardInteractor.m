//
//  LoadBillboardInteractor.m
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "LoadBillboardInteractor.h"

@implementation LoadBillboardInteractor

- (void)loadBillboardFilmsWithCompletionBlock:(CompletionBlock)completionBlock
{
    [self.externalProvider fetchUpcomingAndNowFilms:^(NSArray *films) {
        //Save films to core data;
    }];
    
    completionBlock([NSArray array]);
}

@end
