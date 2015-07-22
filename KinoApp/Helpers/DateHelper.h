//
//  DateHelper.h
//  KinoApp
//
//  Created by Julian Alonso on 22/7/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateHelper : NSObject

+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format;

@end
