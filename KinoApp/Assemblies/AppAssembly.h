//
//  AppAssembly.h
//  KinoApp
//
//  Created by Julian Alonso on 15/7/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "TyphoonAssembly.h"

@class AppDelegate;
@class RouterAssembly;

@interface AppAssembly : TyphoonAssembly

@property (nonatomic, strong, readonly) RouterAssembly *routerAssembly;

- (AppDelegate *)appDelegate;

- (UIWindow *)mainWindow;

@end
