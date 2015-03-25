//
//  FilmDetailListTableViewCellController.h
//  KinoApp
//
//  Created by Julian Alonso on 25/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilmDetailListTableViewCell.h"

@class FilmDetailListTableViewCell;
@class ListDTO;
@class FilmDTO;

@interface FilmDetailListTableViewCellController : NSObject <FilmDetailListTableViewCellDelegate>

@property (nonatomic, weak) FilmDetailListTableViewCell *cell;
@property (nonatomic, strong) ListDTO *list;
@property (nonatomic, strong) FilmDTO *film;

- (UITableViewCell *)configuredCell;

@end
