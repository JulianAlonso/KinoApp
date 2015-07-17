//
//  AppDelegate.m
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "AppDelegate.h"
#import "CoreDataStack.h"
#import "MainRouter.h"
#import "CoreDataManager.h"
#import "CheckNextReleasesInteractor.h"

@interface AppDelegate ()

@property (nonatomic, strong) CoreDataStack *coreDataStack;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.coreDataStack = [CoreDataManager coreDataStack];
    
    [self.mainRouter showMainViewInWindow:self.window];
    
    if ([UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)])
    {
        [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge | UIUserNotificationTypeSound categories:nil]];
    }
    
    [application setMinimumBackgroundFetchInterval:UIApplicationBackgroundFetchIntervalMinimum];
    
    return YES;
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    UIAlertView *notificationAlert = [[UIAlertView alloc] initWithTitle:@"Notification"
                                                                message:notification.alertBody
                                                               delegate:nil
                                                      cancelButtonTitle:@"Ok"
                                                      otherButtonTitles:nil, nil];
    [notificationAlert show];
}

- (void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    CheckNextReleasesInteractor *checkNextReleasesInteractor = [CheckNextReleasesInteractor new];
    
    [checkNextReleasesInteractor checkNextReleasesWithCompletionHandler:completionHandler];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    application.applicationIconBadgeNumber = 0;
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [self.coreDataStack saveContext];
}

@end
