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

@implementation FilmListCollectionViewCell

- (void)awakeFromNib
{
    self.listNameLabel.font = [UIFont appBoldFontWithSize:44.0f];
    self.listNameLabel.textColor = [UIColor selectedItemColor];
}

@end
