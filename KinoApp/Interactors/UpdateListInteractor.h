//
//  UpdateListInteractor.h
//  KinoApp
//
//  Created by Julian Alonso on 25/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LocalListsProvider.h"

@class ListDTO;

@interface UpdateListInteractor : NSObject

@property (nonatomic, strong) id<LocalListsProvider> localListProvider;

- (void)updateList:(ListDTO *)list completion:(void(^)(ListDTO *list))completion;

@end
