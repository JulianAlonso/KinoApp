//
//  LoadUpcomingFilmsInteractor.h
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExternalFilmsProvider.h"

typedef void(^CompletionBlock)(NSArray *films);

@interface LoadUpcomingFilmsInteractor : NSObject

@property (nonatomic, strong) id<ExternalFilmsProvider> externalProvider;

- (void)loadUpcomingFilms:(CompletionBlock)completionBlock;

@end
