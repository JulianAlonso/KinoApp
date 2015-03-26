//
//  GenreFilmDetailCollectionViewCell.h
//  KinoApp
//
//  Created by Julian Alonso on 26/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FilmDetailGenreCollectionViewCellController;

@interface GenreFilmDetailCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *genreNameLabel;
@property (nonatomic, strong) FilmDetailGenreCollectionViewCellController *controller;

@end
