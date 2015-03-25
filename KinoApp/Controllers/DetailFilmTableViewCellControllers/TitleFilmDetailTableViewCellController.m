//
//  TitleFilmDetailTableViewCellController.m
//  KinoApp
//
//  Created by Julian Alonso on 24/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "TitleFilmDetailTableViewCellController.h"
#import "TitleFilmDetailTableViewCell.h"
#import "FilmDTO.h"

@implementation TitleFilmDetailTableViewCellController

@synthesize cell = _cell;
@synthesize film = _film;

- (UITableViewCell *)configuredCell
{
    TitleFilmDetailTableViewCell *cell = self.cell;
    
    cell.filmTitleLabel.text = self.film.filmTitle;
    
    return self.cell;
}

- (CGFloat)cellHeightWithWidth:(CGFloat)width
{
    TitleFilmDetailTableViewCell *cell = (TitleFilmDetailTableViewCell *)[self configuredCell];
    CGFloat height = CGRectGetHeight(cell.contentView.frame) - CGRectGetHeight(cell.filmTitleLabel.frame);
    CGRect labelHeight = [cell.filmTitleLabel.text boundingRectWithSize:CGSizeMake(width, 0)
                                                                     options:NSStringDrawingUsesLineFragmentOrigin
                                                                  attributes:@{NSFontAttributeName : cell.filmTitleLabel.font}
                                                                     context:nil];
    return CGRectGetHeight(labelHeight) + height;
}

@end
