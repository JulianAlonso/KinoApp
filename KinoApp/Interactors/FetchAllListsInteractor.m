//
//  FetchAllFilmsInteractor.m
//  KinoApp
//
//  Created by Julian Alonso on 18/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "FetchAllListsInteractor.h"

@implementation FetchAllListsInteractor

- (void)fetchAllListsWithCompletion:(void(^)(NSArray *lists))completion
{
    [self.localListProvider fetchAllListsWithCompletion:^(NSArray *films) {
        completion(films);
    }];
}

@end
