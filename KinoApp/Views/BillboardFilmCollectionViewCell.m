//
//  BillboardCollectionViewCell.m
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "BillboardFilmCollectionViewCell.h"

@implementation BillboardFilmCollectionViewCell

- (void)awakeFromNib
{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cellPressed:)];
    [self addGestureRecognizer:tapGesture];
}

#pragma mark - Action methods.
- (void)cellPressed:(UITapGestureRecognizer *)sender
{
    [self.delegate billboardFilmCollectionViewCell:self didTapWithSender:sender];
}

@end
