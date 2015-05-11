//
//  CheckNextReleasesInteractor.m
//  KinoApp
//
//  Created by Julian Alonso on 11/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "CheckNextReleasesInteractor.h"

@implementation CheckNextReleasesInteractor

- (void)checkNextReleasesWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:0];
    notification.alertBody = [NSString stringWithFormat:@"Test notification from fetch"];
    notification.timeZone = [NSTimeZone defaultTimeZone];
    notification.soundName = UILocalNotificationDefaultSoundName;
    notification.applicationIconBadgeNumber = [UIApplication sharedApplication].applicationIconBadgeNumber + 1;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    
    completionHandler(UIBackgroundFetchResultNoData);
}

@end
