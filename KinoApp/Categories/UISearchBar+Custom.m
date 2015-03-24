//
//  UISearchBar+Customize.m
//  Instaround
//
//  Created by Francisco Sevillano on 07/09/14.
//  Copyright (c) 2014 Francisco Sevillano. All rights reserved.
//

#import "UISearchBar+Custom.h"

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

@implementation UISearchBar (Custom)

- (void)setTextColor:(UIColor *)color
{
    UITextField *textField = [self getTextField];
    [textField setTintColor:[UIColor whiteColor]];
    textField.textColor = color;
}

- (void)setTextBackgroundColor:(UIColor *)textBackgroundColor
{
    UITextField *textField = [self getTextField];
    [textField setTintColor:[UIColor whiteColor]];
    textField.backgroundColor = textBackgroundColor;
}

- (void)setPlaceholderColor:(UIColor *)placeHolderColor
{
    UITextField *textField = [self getTextField];
    textField.attributedPlaceholder =
    [[NSAttributedString alloc] initWithString:textField.attributedPlaceholder.string attributes:@{NSForegroundColorAttributeName: placeHolderColor}];
}

- (void)setTextFont:(UIFont *)font
{
    UITextField *textField = [self getTextField];
    textField.font = font;
}

- (UITextField *)getTextField
{
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0"))
    {
        for (UIView *subview in self.subviews)
        {
            for (UIView *secondLevelSubview in subview.subviews)
            {
                if ([secondLevelSubview isKindOfClass:[UITextField class]])
                {
                    return (UITextField *)secondLevelSubview;
                }
            }
        }
    }
    
    return nil;
}



@end
