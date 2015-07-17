//
//  AppAssembly.m
//  KinoApp
//
//  Created by Julian Alonso on 15/7/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "AppAssembly.h"
#import "AppDelegate.h"
#import "RouterAssembly.h"

@implementation AppAssembly

- (AppDelegate *)appDelegate
{
	return [TyphoonDefinition withClass:[AppDelegate class] configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(window) with:[self mainWindow]];
        [definition injectProperty:@selector(mainRouter) with:[_routerAssembly mainRouter]];
    }];
}

- (UIWindow *)mainWindow
{
    return [TyphoonDefinition withClass:[UIWindow class] configuration:^(TyphoonDefinition *definition)
    {
        [definition useInitializer:@selector(initWithFrame:) parameters:^(TyphoonMethod *initializer)
        {
            [initializer injectParameterWith:[NSValue valueWithCGRect:[UIScreen mainScreen].bounds]];
        }];
    }];
}

@end
