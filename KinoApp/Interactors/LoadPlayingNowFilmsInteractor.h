//
//  LoadPlayingNowInteractor.h
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExternalFilmsProvider.h"
#import "BillboardFilmsInteractor.h"
#import "LocalFilmsProvider.h"

typedef void(^CompletionBlock)(NSArray *films);

@interface LoadPlayingNowFilmsInteractor : NSObject <BillboardFilmsInteractor>

@property (nonatomic, strong) id<ExternalFilmsProvider> externalProvider;
@property (nonatomic, strong) id<LocalFilmsProvider> localProvider;

@end
