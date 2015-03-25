//
//  DetailFilmTableViewCellController.h
//  KinoApp
//
//  Created by Julian Alonso on 24/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FilmDTO;

@protocol DetailFilmTableViewCellController <NSObject>

@property (nonatomic, weak) id cell;
@property (nonatomic, strong) FilmDTO *film;

- (UITableViewCell *)configuredCell;

- (CGFloat)cellHeightWithWidth:(CGFloat)width;

@end
