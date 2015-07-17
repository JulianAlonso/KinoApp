//
//  LoadUpcomingFilmsInteractor.m
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "LoadUpcomingFilmsInteractor.h"
#import "FilmDTO.h"


@implementation LoadUpcomingFilmsInteractor

#pragma mark - BillboardFilmsInteractor methods.
- (void)fetchFilmsWithLocalData:(CompletionBlock)localCompletionBlock update:(void(^)(NSArray *films))updateCompletionBlock;
{
    [self loadUpcomingFilms:localCompletionBlock];
    
    [self updateFilms:updateCompletionBlock];
}

#pragma mark - Own methods.
- (void)loadUpcomingFilms:(CompletionBlock)completionBlock
{
    [self.localProvider fetchFilmsByFilmType:TYPE_UPCOMING andCompletion:completionBlock];
}

- (void)updateFilms:(CompletionBlock)updatedBlock
{
    __weak typeof(self) weakSelf = self;
    [self.externalProvider fetchUpcomingFilms:^(NSArray *films)
    {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf.localProvider saveFilms:films completion:updatedBlock];
    }];
}

@end
