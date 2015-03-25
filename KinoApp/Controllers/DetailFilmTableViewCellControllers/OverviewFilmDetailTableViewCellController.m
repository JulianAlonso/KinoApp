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
    
    cell.filmOverviewLabel.text = self.film.filmOverview;
    
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

@end
