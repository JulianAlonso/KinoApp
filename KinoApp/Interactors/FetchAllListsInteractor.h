//
//  FetchAllFilmsInteractor.h
//  KinoApp
//
//  Created by Julian Alonso on 18/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LocalListsProvider.h"


@interface FetchAllListsInteractor : NSObject

@property (nonatomic, strong) id<LocalListsProvider> localListProvider;

- (void)fetchAllListsWithCompletion:(void(^)(NSArray *lists))completion;

@end
