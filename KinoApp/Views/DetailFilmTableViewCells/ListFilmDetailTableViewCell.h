//
//  ListFilmDetailTableViewCell.h
//  KinoApp
//
//  Created by Julian Alonso on 24/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilmDetailViewCell.h"

@class FetchAllListsInteractor;
@class FilmDTO;

@interface ListFilmDetailTableViewCell : UITableViewCell <FilmDetailViewCell>

@property (nonatomic, strong) FetchAllListsInteractor *fetchListsInteractor;
@property (nonatomic, strong) FilmDTO *film;

@end
