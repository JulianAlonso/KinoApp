//
//  FilmTableViewCell.m
//  KinoApp
//
//  Created by Julian Alonso on 20/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "FilmTableViewCell.h"
#import "UIColor+Custom.h"
#import "UIFont+Custom.h"
#import "JAStarsView.h"

#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

@implementation FilmTableViewCell

- (void)awakeFromNib
{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedEvent:)];
    [self addGestureRecognizer:tapGesture];
    
    [self configStyles];
}

- (void)prepareForReuse
{
    self.filmImageView.image = nil;
    self.filmTitleLabel.text = @"";
    self.filmYearLabel.text = @"";
    self.filmStarsView.note = @(0);
}

- (void)configStyles
{
    self.backgroundColor = [UIColor appBGColor];
    self.filmTitleLabel.textColor = RGB(200, 200, 200);
    self.filmYearLabel.textColor = [UIColor unselectedItemColor];
    
    self.filmTitleLabel.font = [UIFont appFontWithSize:20.0f];
    self.filmYearLabel.font = [UIFont appFontWithSize:15.0f];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self setSelected:NO];
}

#pragma mark - Action methods.
- (void)tappedEvent:(UITapGestureRecognizer *)sender
{
    [self.delegate filmTableViewCell:self didTapWithSender:sender];
}

@end
