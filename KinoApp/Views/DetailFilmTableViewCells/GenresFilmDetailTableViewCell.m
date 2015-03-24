//
//  GenresFilmDetailTableViewCell.m
//  KinoApp
//
//  Created by Julian Alonso on 24/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "GenresFilmDetailTableViewCell.h"

@implementation GenresFilmDetailTableViewCell

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
    self.backgroundColor = [UIColor clearColor];
}

@end
