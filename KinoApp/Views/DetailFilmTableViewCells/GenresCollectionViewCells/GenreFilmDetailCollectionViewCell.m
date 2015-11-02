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

static NSString *const kFrameProperty = @"frame";

@implementation GenreFilmDetailCollectionViewCell

- (void)awakeFromNib
{
    [self configStyles];
    [self registerObservers];
}

- (void)dealloc
{
    [self removeObservers];
}

#pragma mark - Observe methods.
- (void)registerObservers
{
    [self.contentView addObserver:self forKeyPath:kFrameProperty options:NSKeyValueObservingOptionInitial context:nil];
}

- (void)removeObservers
{
    [self.contentView removeObserver:self forKeyPath:kFrameProperty];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:kFrameProperty])
    {
        [self updateCornerRaius];
    }
}

#pragma mark - Config methods.
- (void)configStyles
{
    self.genreNameLabel.font = [UIFont appSemiBoldFontWithSize:15.0f];
    self.genreNameLabel.textColor = [UIColor selectedItemColor];
    self.genreNameLabel.shadowColor = RGBA(0, 0, 0, 0.5f);
    self.genreNameLabel.shadowOffset = CGSizeMake(0.0f, 1.0f);
    self.contentView.layer.borderColor = [[UIColor selectedItemColor] CGColor];
    self.contentView.layer.borderWidth = 1.0f;
    self.contentView.layer.shadowColor = RGBA(0, 0, 0, 0.5f).CGColor;
    self.contentView.layer.shadowOffset = CGSizeMake(0.0f, 6.0f);
}

- (void)updateCornerRaius
{
    self.contentView.layer.cornerRadius = CGRectGetHeight(self.contentView.frame) / 2.0f;
    self.contentView.layer.shadowColor = RGBA(0, 0, 0, 0.5f).CGColor;
    self.contentView.layer.shadowOffset = CGSizeMake(0.0f, 6.0f);
}

@end


