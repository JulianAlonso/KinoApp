//
//  RequestManagerFactory.m
//  KinoApp
//
//  Created by Julian Alonso on 17/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "RequestManagerFactory.h"
#import "APIVars.h"
#import "JARequestManager.h"

NSString *const kDefaultParams = @"defaultParams";
NSString *const kBasePath = @"basePath";

@implementation RequestManagerFactory

+ (id<RequestManager>)requestManager
{
    NSDictionary *defaultParams = @{
                                    @"api_key" : API_KEY,
                                    @"language" : @"es",
                                    };
    
    JARequestManager *requestManager = [JARequestManager new];
    [requestManager setValue:defaultParams forKey:kDefaultParams];
    [requestManager setValue:BASE_PATH forKey:kBasePath];
    
    return requestManager;
}

@end
