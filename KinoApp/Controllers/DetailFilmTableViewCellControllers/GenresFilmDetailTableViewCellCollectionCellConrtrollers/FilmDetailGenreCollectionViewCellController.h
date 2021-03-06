//
//  FilmDetailGenreCollectionViewCellController.h
//  KinoApp
//
//  Created by Julian Alonso on 26/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GenreDTO;
@class GenreFilmDetailCollectionViewCell;

@interface FilmDetailGenreCollectionViewCellController : NSObject

@property (nonatomic, weak) GenreFilmDetailCollectionViewCell *cell;
@property (nonatomic, strong) GenreDTO *genre;

- (UICollectionViewCell *)configuredCell;

@end
