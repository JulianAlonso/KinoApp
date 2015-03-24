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


@end
