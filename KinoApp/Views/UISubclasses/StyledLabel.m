//
//  StyledLabel.m
//  KinoApp
//
//  Created by Julian Alonso on 30/7/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "StyledLabel.h"
#import "UIColor+Custom.h"

@implementation StyledLabel

- (void)didMoveToSuperview
{
    self.textColor = [UIColor selectedItemColor];
    // set the font.
}

@end
