//
//  NSDictionary+Utilities.m
//  KinoApp
//
//  Created by Julian Alonso on 2/11/15.
//  Copyright © 2015 Julian. All rights reserved.
//

#import "NSDictionary+Utilities.h"

@implementation NSDictionary (Utilities)

- (NSString *)stringWithKey:(NSString *)key
{
    NSString *value;
    if (self[key])
    {
        value = [NSString stringWithFormat:@"%@", self[key]];
        
        if ([value isEqualToString:@"<null>"])
        {
            value = nil;
        }
    }
    return value;
}

@end
