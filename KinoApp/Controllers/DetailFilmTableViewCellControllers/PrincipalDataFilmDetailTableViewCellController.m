//
//  PrincipalDataFilmDetailTableViewCellController.m
//  KinoApp
//
//  Created by Julian Alonso on 25/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "PrincipalDataFilmDetailTableViewCellController.h"
#import "PrincipalDataFilmDetailTableViewCell.h"
#import "FilmDTO.h"

@implementation PrincipalDataFilmDetailTableViewCellController

@synthesize film = _film;
@synthesize cell = _cell;

- (UITableViewCell *)configuredCell
{
    PrincipalDataFilmDetailTableViewCell *cell = self.cell;
    
    cell.filmPrincipalDataLabel.text = [NSString stringWithFormat:@"%@ minutes  ·  %@", self.film.filmRuntime, self.film.filmYear];
    
    return self.cell;
}

- (CGFloat)cellHeightWithWidth:(CGFloat)width
{
    PrincipalDataFilmDetailTableViewCell *cell = (PrincipalDataFilmDetailTableViewCell *)[self configuredCell];
    CGFloat height = CGRectGetHeight(cell.contentView.frame) - CGRectGetHeight(cell.filmPrincipalDataLabel.frame);
    CGRect labelHeight = [cell.filmPrincipalDataLabel.text boundingRectWithSize:CGSizeMake(width, 0)
                                                                options:NSStringDrawingUsesLineFragmentOrigin
                                                             attributes:@{NSFontAttributeName : cell.filmPrincipalDataLabel.font}
                                                                context:nil];
    
    return CGRectGetHeight(labelHeight) + height;
}

@end