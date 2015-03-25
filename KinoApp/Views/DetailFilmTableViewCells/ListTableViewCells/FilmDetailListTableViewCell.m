//
//  FilmDetailListTableViewCell.m
//  KinoApp
//
//  Created by Julian Alonso on 25/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "FilmDetailListTableViewCell.h"
#import "UIFont+Custom.h"

@implementation FilmDetailListTableViewCell

- (void)awakeFromNib
{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    [self addGestureRecognizer:tapGesture];
    
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
    self.listNameLabel.font = [UIFont appSemiBoldFontWithSize:15.0f];
    self.listNameLabel.textColor = [UIColor whiteColor];
}

#pragma mark - Delegate methods.
- (void)tapped:(UITapGestureRecognizer *)sender
{
    [self.delegate filmDetailListTableViewCell:self didTappedWithSender:sender];
}

@end
