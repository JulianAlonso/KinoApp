//
//  JARequestManager.m
//  KinoApp
//
//  Created by Julian Alonso on 17/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "JARequestManager.h"

@implementation JARequestManager

@synthesize defaultParams = _defaultParams;
@synthesize basePath = _basePath;

#pragma mark - RequestManager methods.
- (void)GETendpoint:(NSURL *)endpoint params:(NSDictionary *)dictionary andCompletionBlock:(void (^)(NSData *))completionBlock
{
    
}

@end
