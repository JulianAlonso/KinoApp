//
//  FilmDetailHeaderView.m
//  KinoApp
//
//  Created by Julian Alonso on 30/7/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "FilmDetailHeaderView.h"
#import "StyledLabel.h"

@interface FilmDetailHeaderView ()

@property (weak, nonatomic) IBOutlet StyledLabel *filmNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topSpaceConstraint;

@end

@implementation FilmDetailHeaderView

#pragma mark - View methods.
- (void)didMoveToSuperview
{
    [self.backButton addTarget:self
                        action:@selector(didTapAtBackButton)
              forControlEvents:UIControlEventTouchUpInside];
    
    self.topSpaceConstraint.constant = [UIApplication sharedApplication].statusBarFrame.size.height;
    [self setNeedsLayout];
}

#pragma mark - Delegation methods.
- (void)didTapAtBackButton
{
    [self.delegate didTapAtBackButton:self.backButton];
}

#pragma mark - Custom Setters.
- (void)setFilmName:(NSString *)filmName
{
    self.filmNameLabel.text = filmName;
}

#pragma mark - Custom Getters.
- (NSString *)filmName
{
    return self.filmNameLabel.text;
}

@end
