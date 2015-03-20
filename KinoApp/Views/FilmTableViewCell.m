//
//  FilmTableViewCell.m
//  KinoApp
//
//  Created by Julian Alonso on 20/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "FilmTableViewCell.h"

@implementation FilmTableViewCell

- (void)awakeFromNib
{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedEvent:)];
    [self addGestureRecognizer:tapGesture];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#pragma mark - Action methods.
- (void)tappedEvent:(UITapGestureRecognizer *)sender
{
    [self.delegate filmTableViewCell:self didTapWithSender:sender];
}

@end
