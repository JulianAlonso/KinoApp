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
    return [UIFont fontWithName:@"Helvetica-Light" size:size];
}

+ (UIFont *)appSemiBoldFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"Helvetica" size:size];
}

+ (UIFont *)appBoldFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"Helvetica-Bold" size:size];
}

@end
