//
//  RequestManagerFactory.h
//  KinoApp
//
//  Created by Julian Alonso on 17/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestManager.h"

@interface RequestManagerFactory : NSObject

+ (id<RequestManager>)requestManager;

@end
