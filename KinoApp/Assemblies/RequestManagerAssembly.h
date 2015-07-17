//
//  RequestManagerAssembly.h
//  KinoApp
//
//  Created by Julian Alonso on 15/7/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "TyphoonAssembly.h"
#import "RequestManager.h"

@interface RequestManagerAssembly : TyphoonAssembly

- (id<RequestManager>)requestManager;

@end
