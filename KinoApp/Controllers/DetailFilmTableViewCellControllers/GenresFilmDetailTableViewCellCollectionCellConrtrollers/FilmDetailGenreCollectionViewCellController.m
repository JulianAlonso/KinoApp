//
//  FilmDetailGenreCollectionViewCellController.m
//  KinoApp
//
//  Created by Julian Alonso on 26/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "FilmDetailGenreCollectionViewCellController.h"
#import "GenreFilmDetailCollectionViewCell.h"
#import "GenreDTO.h"

@implementation FilmDetailGenreCollectionViewCellController

- (UICollectionViewCell *)configuredCell
{
    self.cell.genreNameLabel.text = self.genre.genreName;
    
    return self.cell;
}

@end
