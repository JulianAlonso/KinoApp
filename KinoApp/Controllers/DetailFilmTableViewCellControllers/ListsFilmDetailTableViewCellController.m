//
//  ListsFilmDetailTableViewCellController.m
//  KinoApp
//
//  Created by Julian Alonso on 24/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "ListsFilmDetailTableViewCellController.h"
#import "ListFilmDetailTableViewCell.h"

@implementation ListsFilmDetailTableViewCellController

@synthesize cell = _cell;
@synthesize film = _film;

- (UITableViewCell *)configuredCell
{
    ListFilmDetailTableViewCell *cell = (ListFilmDetailTableViewCell *)self.cell;
    
    cell.film = self.film;
    
    return self.cell;
}

- (CGFloat)cellHeightWithWidth:(CGFloat)width
{
    return 0.0f;
}

@end
