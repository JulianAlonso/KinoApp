//
//  UIColor+Custom.m
//  KinoApp
//
//  Created by Julian Alonso on 23/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#import "UIColor+Custom.h"

@implementation UIColor (Custom)

+ (UIColor *)appBGColor
{
    return RGBA(14, 14, 14, 0.9);
}

+ (UIColor *)selectedItemColor
{
    return RGB(245, 166, 35);
}

+ (UIColor *)unselectedItemColor
{
    return RGB(151, 151, 151);
}

@end
