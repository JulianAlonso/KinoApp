//
//  OverviewFilmDetailTableViewCell.m
//  KinoApp
//
//  Created by Julian Alonso on 24/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "OverviewFilmDetailTableViewCell.h"
#import "UIFont+Custom.h"

@implementation OverviewFilmDetailTableViewCell

@synthesize controller = _controller;

- (void)awakeFromNib
{
    [self configStyles];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

#pragma mark - Config methods.
- (void)configStyles
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    
    self.filmOverviewLabel.textColor = [UIColor whiteColor];
    self.filmOverviewLabel.font = [UIFont appSemiBoldFontWithSize:16.0f];
}

@end
