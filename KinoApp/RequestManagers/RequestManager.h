//
//  RequestManager.h
//  KinoApp
//
//  Created by Julian Alonso on 17/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RequestManager <NSObject>

@property (nonatomic, strong, readonly) NSDictionary *defaultParams;
@property (nonatomic, strong, readonly) NSString *basePath;

- (void)GETendpoint:(NSString *)endpoint params:(NSDictionary *)params andCompletionBlock:(void(^)(NSData *data))completionBlock;

@end
