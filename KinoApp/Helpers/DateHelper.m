//
//  DateHelper.m
//  KinoApp
//
//  Created by Julian Alonso on 22/7/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "DateHelper.h"

@implementation DateHelper

+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format
{
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = format;
    
    return [dateFormatter dateFromString:string];
}

+ (NSString *)yearStirngFromDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"yyyy";
    
    return [dateFormatter stringFromDate:date];
}

@end
