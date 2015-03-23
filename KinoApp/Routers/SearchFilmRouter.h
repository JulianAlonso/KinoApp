//
//  SearchListRouter.h
//  KinoApp
//
//  Created by Julian Alonso on 20/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ListDTO;
@class FilmDTO;

@interface SearchFilmRouter : NSObject

- (void)presentSearchFrom:(UINavigationController *)fromNavigationController andList:(ListDTO *)list;

- (void)tappedCellWithFilm:(FilmDTO *)film;

@end
