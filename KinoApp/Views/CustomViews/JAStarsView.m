//
//  JAStarsView.m
//  KinoApp
//
//  Created by Julian Alonso on 2/11/15.
//  Copyright © 2015 Julian. All rights reserved.
//

#import "JAStarsView.h"

@interface JAStarsView ()

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *starImagesView;


@end

@implementation JAStarsView

- (void)updateStars
{
    CGFloat note = self.note.floatValue / 2;
    for (UIImageView *startIV in self.starImagesView)
    {
        if (note >= 1)
        {
            startIV.image = [UIImage imageNamed:@"FilledStar"];
        }
        else if (note >= 0.5f && note < 1.0f)
        {
            startIV.image = [UIImage imageNamed:@"SemiFilledStar"];
        }
        else
        {
            startIV.image = [UIImage imageNamed:@"Star"];
        }
        note--;
    }
}

#pragma mark - Custom setters methods.
- (void)setNote:(NSNumber *)note
{
    _note = note;
    [self updateStars];
}

@end
