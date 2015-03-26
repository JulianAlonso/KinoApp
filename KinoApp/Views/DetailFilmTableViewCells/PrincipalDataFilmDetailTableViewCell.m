//
//  PrincipalDataFilmDetailTableViewCell.m
//  KinoApp
//
//  Created by Julian Alonso on 25/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "PrincipalDataFilmDetailTableViewCell.h"
#import "UIFont+Custom.h"

@implementation PrincipalDataFilmDetailTableViewCell

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
    
    self.filmPrincipalDataLabel.font = [UIFont appFontWithSize:20.0f];
    self.filmPrincipalDataLabel.textColor = [UIColor whiteColor];
}

@end
