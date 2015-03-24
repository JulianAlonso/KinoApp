//
//  TitleFilmDetailTableViewCell.m
//  KinoApp
//
//  Created by Julian Alonso on 24/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "TitleFilmDetailTableViewCell.h"
#import "UIFont+Custom.h"
#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
@implementation TitleFilmDetailTableViewCell

@synthesize controller = _controller;

- (void)awakeFromNib
{
    [self configStyles];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#pragma mark - config methods.
- (void)configStyles
{
    self.backgroundColor = RGBA(51, 51, 51, 0.7f);
    
    self.filmTitleLabel.textColor = [UIColor whiteColor];
    self.filmTitleLabel.font = [UIFont appFontWithSize:30];
    
    self.filmPrincipalDataLabel.textColor = [UIColor whiteColor];
    self.filmPrincipalDataLabel.font = [UIFont appFontWithSize:18];
}

@end
