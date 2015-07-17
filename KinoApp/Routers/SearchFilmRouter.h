//
//  SearchListRouter.h
//  KinoApp
//
//  Created by Julian Alonso on 20/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RouterAssembly;
@class SearchFilmViewController;
@class ListDTO;
@class FilmDTO;

@interface SearchFilmRouter : NSObject

@property (nonatomic, strong) RouterAssembly *routerAssembly;
@property (nonatomic, weak) SearchFilmViewController *searchFilmViewController;


- (void)presentSearchFrom:(UINavigationController *)fromNavigationController andList:(ListDTO *)list;

- (void)popSearchFilmViewController;

- (void)tappedCellWithFilm:(FilmDTO *)film;

@end
