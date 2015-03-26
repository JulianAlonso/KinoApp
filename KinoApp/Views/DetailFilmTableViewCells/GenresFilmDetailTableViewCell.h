//
//  GenresFilmDetailTableViewCell.h
//  KinoApp
//
//  Created by Julian Alonso on 24/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilmDetailViewCell.h"

@class FilmDTO;

@interface GenresFilmDetailTableViewCell : UITableViewCell <FilmDetailViewCell>

@property (nonatomic, strong) FilmDTO *film;

@end
