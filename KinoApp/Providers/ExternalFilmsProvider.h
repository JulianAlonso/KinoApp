//
//  ExternalFilmsProvider.h
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ExternalFilmsProvider <NSObject>

- (void)fetchUpcomingAndNowFilms:(void(^)(NSArray *films))completion;

@end
