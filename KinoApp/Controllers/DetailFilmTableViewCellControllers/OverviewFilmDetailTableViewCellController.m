//
//  OverviewFilmDetailTableViewCellController.m
//  KinoApp
//
//  Created by Julian Alonso on 24/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "OverviewFilmDetailTableViewCellController.h"
#import "OverviewFilmDetailTableViewCell.h"
#import "FilmDTO.h"

@implementation OverviewFilmDetailTableViewCellController

@synthesize cell = _cell;
@synthesize film = _film;

- (UITableViewCell *)configuredCell
{
    OverviewFilmDetailTableViewCell *cell = self.cell;
    
    if (self.film.filmOverview)
    {
        [self configLabel:cell];
    }
    
    return self.cell;
}

- (CGFloat)cellHeightWithWidth:(CGFloat)width
{
    OverviewFilmDetailTableViewCell *cell = (OverviewFilmDetailTableViewCell *)[self configuredCell];
    CGFloat height = CGRectGetHeight(cell.contentView.frame) - CGRectGetHeight(cell.filmOverviewLabel.frame);
    CGRect labelHeight = [cell.filmOverviewLabel.text boundingRectWithSize:CGSizeMake(width, 0)
                                                                options:NSStringDrawingUsesLineFragmentOrigin
                                                             attributes:@{NSFontAttributeName : cell.filmOverviewLabel.font}
                                                                context:nil];
    
    return CGRectGetHeight(labelHeight) - height;
}

#pragma mark - Config methods.
- (void)configLabel:(OverviewFilmDetailTableViewCell *)cell
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.film.filmOverview];
    NSMutableParagraphStyle *paragrahStyle = [[NSMutableParagraphStyle alloc] init];
    [paragrahStyle setLineSpacing:2];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragrahStyle range:NSMakeRange(0, [self.film.filmOverview length] - 1)];
    
    cell.filmOverviewLabel.attributedText = attributedString;
}

@end
