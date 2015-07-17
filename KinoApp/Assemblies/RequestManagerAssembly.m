//
//  RequestManagerAssembly.m
//  KinoApp
//
//  Created by Julian Alonso on 15/7/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "RequestManagerAssembly.h"
#import "JARequestManager.h"
#import "APIVars.h"

@implementation RequestManagerAssembly

- (id<RequestManager>)requestManager
{
    return [TyphoonDefinition withClass:[JARequestManager class] configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(basePath) with:BASE_PATH];
        [definition injectProperty:@selector(defaultParams) with:@{@"api_key" : API_KEY, @"language" : @"es"}];
    }];
}

@end
