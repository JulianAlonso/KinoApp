//
//  InteractorsFactory.h
//  KinoApp
//
//  Created by Julian Alonso on 25/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FetchAllListsInteractor;

@interface InteractorsFactory : NSObject

+ (FetchAllListsInteractor *)fetchAllListsInteractor;

@end