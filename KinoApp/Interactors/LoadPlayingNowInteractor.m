//
//  LoadPlayingNowInteractor.m
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "LoadPlayingNowInteractor.h"

@implementation LoadPlayingNowInteractor

- (void)loadPlayingNowFilms:(CompletionBlock)completionBlock
{
    [self.externalProvider fetchPlayingNowFilms:^(NSArray *films) {
        //Save to coredata
    }];
    //Read from coredata
    //completionBlock(readedData);
}

@end
