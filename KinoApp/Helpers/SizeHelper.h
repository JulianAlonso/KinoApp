//
//  SizeHelper.h
//  KinoApp
//
//  Created by Julian Alonso on 26/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GenreDTO;
@class FilmDTO;

@interface SizeHelper : NSObject

+ (CGSize)filmDetailGenreCollectionViewCellSizeForGenre:(GenreDTO *)genre;

+ (CGFloat)titleFilmDetailTableViewCellHeightForFilm:(FilmDTO *)film andWidth:(CGFloat)width;
+ (CGFloat)principalFilmDetailTableViewCellHeightForFilm:(FilmDTO *)film andWidth:(CGFloat)width;
+ (CGFloat)overviewFilmDetailTableViewCellHeightForFilm:(FilmDTO *)film andWidth:(CGFloat)width;

@end
