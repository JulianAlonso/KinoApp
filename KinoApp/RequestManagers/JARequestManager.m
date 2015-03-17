//
//  JARequestManager.m
//  KinoApp
//
//  Created by Julian Alonso on 17/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "JARequestManager.h"

NSString *const kBackgroundSession = @"BackgroundSession";

@implementation JARequestManager

@synthesize defaultParams = _defaultParams;
@synthesize basePath = _basePath;

#pragma mark - RequestManager methods.
- (void)GETendpoint:(NSURL *)endpoint params:(NSDictionary *)params andCompletionBlock:(void (^)(NSData *))completionBlock
{
    NSMutableString *url = [NSMutableString stringWithFormat:@"%@%@", self.basePath, endpoint];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSMutableDictionary *allParams = [self.defaultParams mutableCopy];
    [allParams addEntriesFromDictionary: params];
    
    [[session dataTaskWithURL:[self urlWithString:url andParams:allParams] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
       
        if (error)
        {
            completionBlock(nil);
        }
        else
        {
            completionBlock(data);
        }
        
    }] resume];
}

@end
