//
//  URLHelper.m
//  KinoApp
//
//  Created by Julian Alonso on 17/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "URLHelper.h"

@implementation URLHelper

+ (NSURL *)urlWithString:(NSString *)url andParams:(NSDictionary *)params
{
    NSMutableString *finalURL = [url mutableCopy];
    BOOL firstTime = YES;
    for (NSString *key in params)
    {
        if (firstTime)
        {
            [finalURL appendFormat:@"?%@=%@", key, params[key]];
        }
        else
        {
            [finalURL appendFormat:@"&%@=%@", key, params[key]];
        }
    }
    return [NSURL URLWithString:finalURL];
}

@end
