//
//  ListCollectionViewCell.m
//  KinoApp
//
//  Created by Julian Alonso on 18/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "FilmListCollectionViewCell.h"
#import "UIFont+Custom.h"
#import "UIColor+Custom.h"

@interface FilmListCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIView *imagesContentView;
@property (nonatomic, strong) CALayer *backgroundLayer;

@end

@implementation FilmListCollectionViewCell

- (void)awakeFromNib
{
    [self configStyles];
}

#pragma mark - Config methods.
- (void)configStyles
{
    self.listNameLabel.font = [UIFont appBoldFontWithSize:44.0f];
    self.listNameLabel.textColor = [UIColor selectedItemColor];
}

#pragma mark - Public methods.
- (void)addBackgroundLayer
{
    
}

- (void)removeBackgroundLayer
{
    
}

@end
