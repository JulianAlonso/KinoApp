//
//  UpdateListInteractor.m
//  KinoApp
//
//  Created by Julian Alonso on 25/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "UpdateListInteractor.h"

@implementation UpdateListInteractor

- (void)updateList:(ListDTO *)list completion:(void(^)(ListDTO *list))completion {

    [self.localListProvider updateList:list completion:completion];
    
}

@end
