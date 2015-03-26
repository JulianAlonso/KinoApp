//
//  GrayBackgroundLayer.m
//  KinoApp
//
//  Created by Julian Alonso on 24/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "GrayBackgroundLayer.h"

#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

@interface GrayBackgroundLayer ()

@end

@implementation GrayBackgroundLayer

- (CAGradientLayer *)loadPrivateGrayBackgroundLayer
{
    UIColor *colorOne = [UIColor clearColor];
    UIColor *colorTwo = RGBA(14, 14, 14, 0.6f);
    
//    CGFloat locationOne = 0.4f;
//    CGFloat locationTwo = 0.8f;
    
    CAGradientLayer *grayLayer = [CAGradientLayer layer];
    grayLayer.colors = @[colorOne, colorTwo];
    grayLayer.startPoint = CGPointMake(0.0f, 0.5f);
    grayLayer.endPoint = CGPointMake(0.5f, 1.0f);
    
    return grayLayer;
}


#pragma mark - Lazy Getters methods.
- (CAGradientLayer *)grayBackgroundLayer
{
    if (!_grayBackgroundLayer)
    {
        _grayBackgroundLayer = [self loadPrivateGrayBackgroundLayer];
    }
    return _grayBackgroundLayer;
}

@end
