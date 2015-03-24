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
    cell.filmPrincipalDataLabel.text = [NSString stringWithFormat:@"%@ minutes  ·  %@", self.film.filmRuntime, self.film.filmYear];
    
    return self.cell;
}

@end
