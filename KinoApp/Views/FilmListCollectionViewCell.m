//
//  ListCollectionViewCell.m
//  KinoApp
//
//  Created by Julian Alonso on 18/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "FilmListCollectionViewCell.h"
#import "UIFont+Custom.h"
#import "UIColor+Custom.h"

@interface FilmListCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIView *imagesContentView;

@end

@implementation FilmListCollectionViewCell

- (void)awakeFromNib
{
    self.listNameLabel.font = [UIFont appBoldFontWithSize:44.0f];
    self.listNameLabel.textColor = [UIColor selectedItemColor];
    
    [self configStyles];
}

- (void)configStyles
{
//    CAShapeLayer *dashedLayer = [CAShapeLayer layer];
//    
//    CGRect layerFrame = CGRectMake(0, 0, CGRectGetWidth(self.oneImageView.bounds) - 10, CGRectGetHeight(self.oneImageView.bounds) - 10);
//    
//    dashedLayer.path = [[UIBezierPath bezierPathWithRect:layerFrame] CGPath];
//    dashedLayer.strokeColor = [[UIColor selectedItemColor] CGColor];
//    dashedLayer.lineWidth = 4.0f;
//    dashedLayer.lineDashPattern = @[@(20), @(5)];
//    dashedLayer.backgroundColor = [[UIColor clearColor] CGColor];
//    
//    [self.oneImageView.layer addSublayer:dashedLayer];
}

@end
