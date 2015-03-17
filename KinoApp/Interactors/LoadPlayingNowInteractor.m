//
//  LoadPlayingNowInteractor.m
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "LoadPlayingNowInteractor.h"
#import "FilmDTO.h"


@implementation LoadPlayingNowInteractor

#pragma mark - BillboardFilmsIteractor methods.
- (void)fetchFilmsWithLocalData:(void(^)(NSArray *films))localCompletionBlock update:(void(^)(NSArray *films))updateCompletionBlock;
{
    [self loadLocalPlayingNowFilms:localCompletionBlock];
    
    [self updateFilms:updateCompletionBlock];
}

#pragma mark - Own methods.
- (void)loadLocalPlayingNowFilms:(CompletionBlock)completionBlock
{
    [self.localProvider fetchFilmsByFilmType:TYPE_PLAYIN_NOW andCompletion:completionBlock];
}

- (void)updateFilms:(CompletionBlock)updatedBlock
{
    __weak typeof(self) weakSelf = self;
    [self.externalProvider fetchPlayingNowFilms:^(NSArray *films) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
        [strongSelf.localProvider saveFilms:films completion:updatedBlock];
    }];
}

@end
