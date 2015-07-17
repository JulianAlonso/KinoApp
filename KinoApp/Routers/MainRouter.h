//
//  MainRouter.h
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

@class RouterAssembly;


@interface MainRouter : NSObject

@property (nonatomic, strong) RouterAssembly *routerAssembly;

- (void)showMainViewInWindow:(UIWindow *)window;

@end
