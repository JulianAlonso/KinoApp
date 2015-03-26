//
//  GenreFilmDetailCollectionViewCell.m
//  KinoApp
//
//  Created by Julian Alonso on 26/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "GenreFilmDetailCollectionViewCell.h"
#import "UIFont+Custom.h"
#import "UIColor+Custom.h"

#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

@implementation GenreFilmDetailCollectionViewCell

- (void)awakeFromNib
{
    [self configStyles];
}

#pragma mark - Config methods.
- (void)configStyles
{
    self.genreNameLabel.font = [UIFont appSemiBoldFontWithSize:22.0f];
    self.genreNameLabel.textColor = [UIColor selectedItemColor];
    self.genreNameLabel.shadowColor = RGBA(0, 0, 0, 0.5f);
    self.genreNameLabel.shadowOffset = CGSizeMake(1.5f, 1.5f);
    self.contentView.layer.borderColor = [[UIColor selectedItemColor] CGColor];
    self.contentView.layer.borderWidth = 3.0f;
    self.contentView.layer.cornerRadius = CGRectGetHeight(self.genreNameLabel.bounds) / 2.7;
}

@end


