//
//  ReachabilityHelper.m
//  KinoApp
//
//  Created by Julian Alonso on 7/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "ReachabilityHelper.h"
#import "Reachability.h"

@implementation ReachabilityHelper

+ (BOOL)internetConnection
{
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    
    return [networkReachability currentReachabilityStatus] != NotReachable;
}

@end
