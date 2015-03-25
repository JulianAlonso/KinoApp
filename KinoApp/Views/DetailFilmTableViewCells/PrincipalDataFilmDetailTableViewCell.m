//
//  PrincipalDataFilmDetailTableViewCell.m
//  KinoApp
//
//  Created by Julian Alonso on 25/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "PrincipalDataFilmDetailTableViewCell.h"
#import "UIFont+Custom.h"

#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

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
    self.backgroundColor = RGBA(51, 51, 51, 0.7f);
    
    self.filmPrincipalDataLabel.font = [UIFont appFontWithSize:20.0f];
    self.filmPrincipalDataLabel.textColor = [UIColor whiteColor];
}

@end
