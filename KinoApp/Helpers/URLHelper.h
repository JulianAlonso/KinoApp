//
//  URLHelper.h
//  KinoApp
//
//  Created by Julian Alonso on 17/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URLHelper : NSObject

+ (NSURL *)urlWithString:(NSString *)url andParams:(NSDictionary *)params;

+ (NSString *)imageUrlWithEndpoint:(NSString *)endpoint;

@end
