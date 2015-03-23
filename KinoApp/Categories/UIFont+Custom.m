//
//  UIFont+Custom.m
//  KinoApp
//
//  Created by Julian Alonso on 23/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "UIFont+Custom.h"

@implementation UIFont (Custom)

+ (UIFont *)appFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"Heveltica-light" size:size];
}

@end
