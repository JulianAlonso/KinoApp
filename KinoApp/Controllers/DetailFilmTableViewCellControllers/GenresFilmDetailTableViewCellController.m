//
//  GenresFilmDetailTableViewCellController.m
//  KinoApp
//
//  Created by Julian Alonso on 24/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "GenresFilmDetailTableViewCellController.h"
#import "GenresFilmDetailTableViewCell.h"

@implementation GenresFilmDetailTableViewCellController

@synthesize cell = _cell;
@synthesize film = _film;

- (UITableViewCell *)configuredCell
{
    GenresFilmDetailTableViewCell *cell = self.cell;
    
    cell.film = self.film;
    
    return self.cell;
}

- (CGFloat)cellHeightWithWidth:(CGFloat)width
{
    return 0.0f;
}

@end
