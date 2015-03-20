//
//  SearchFilmTableViewCellController.h
//  KinoApp
//
//  Created by Julian Alonso on 20/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FilmTableViewCell;
@class FilmDTO;

@interface SearchFilmTableViewCellController : NSObject

@property (nonatomic, weak) FilmTableViewCell *cell;
@property (nonatomic, strong) FilmDTO *film;

- (UITableViewCell *)configuredCell;

@end
