//
//  LoadBillboardInteractor.h
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExternalFilmsProvider.h"

typedef void(^CompletionBlock)(NSArray *films);

@interface LoadBillboardInteractor : NSObject

@property (nonatomic, strong) id<ExternalFilmsProvider> externalProvider;

- (void)loadBillboardFilmsWithCompletionBlock:(CompletionBlock)completionBlock;

@end
