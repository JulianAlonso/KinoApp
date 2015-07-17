//
//  AppDelegate.h
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class MainRouter;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) MainRouter *mainRouter;
@property (strong, nonatomic) UIWindow *window;

@end

