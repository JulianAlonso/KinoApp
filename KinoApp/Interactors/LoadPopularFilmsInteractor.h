//
//  LoadPopularFilmsInteractor.h
//  KinoApp
//
//  Created by Julian Alonso on 20/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExternalFilmsProvider.h"

@interface LoadPopularFilmsInteractor : NSObject

@property (nonatomic, strong) id<ExternalFilmsProvider> externalProvider;

- (void)loadPopularFilms:(void(^)(NSArray *films))completion;

@end
