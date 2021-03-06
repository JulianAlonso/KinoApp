//
//  LoadUpcomingFilmsInteractor.h
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExternalFilmsProvider.h"
#import "BillboardFilmsInteractor.h"
#import "LocalFilmsProvider.h"

typedef void(^CompletionBlock)(NSArray *films);

@interface LoadUpcomingFilmsInteractor : NSObject <BillboardFilmsInteractor>

@property (nonatomic, strong) id<ExternalFilmsProvider> externalProvider;
@property (nonatomic, strong) id<LocalFilmsProvider> localProvider;

@end
