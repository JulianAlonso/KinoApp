//
//  SearchFilmTableViewCellController.h
//  KinoApp
//
//  Created by Julian Alonso on 20/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SearchFilmTableViewCellController;
@class FilmTableViewCell;
@class FilmDTO;

@protocol SearchFilmTableViewCellControllerDelegate <NSObject>

- (void)searchFilmTableViewCellController:(SearchFilmTableViewCellController *)earchFilmTableViewCellController
                       tappedCellWithFilm:(FilmDTO *)film;

@end

@interface SearchFilmTableViewCellController : NSObject

@property (nonatomic, weak) FilmTableViewCell *cell;
@property (nonatomic, weak) id<SearchFilmTableViewCellControllerDelegate> delegate;
@property (nonatomic, strong) FilmDTO *film;


- (UITableViewCell *)configuredCell;

@end
