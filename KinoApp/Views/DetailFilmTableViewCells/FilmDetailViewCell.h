//
//  FilmDetailViewCell.h
//  KinoApp
//
//  Created by Julian Alonso on 24/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DetailFilmTableViewCellController.h"

@class FilmDTO;

@protocol FilmDetailViewCell <NSObject>

@property (nonatomic, strong) id<DetailFilmTableViewCellController> controller;

@end
