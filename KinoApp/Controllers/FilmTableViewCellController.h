//
//  FilmTableViewCellController.h
//  KinoApp
//
//  Created by Julian Alonso on 20/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FilmTableViewCell;
@class FilmDTO;
@class FilmTableViewCellController;

@protocol FilmTableViewControllerCellDelegate <NSObject>

- (void)filmTableViewCellController:(FilmTableViewCellController *)filmTableViewCellController tappedCellWithFilm:(FilmDTO *)film;

@end

@interface FilmTableViewCellController : NSObject

@property (nonatomic, strong) FilmDTO *film;
@property (nonatomic, weak) FilmTableViewCell *cell;
@property (nonatomic, weak) id<FilmTableViewControllerCellDelegate> delegate;

- (UITableViewCell *)configuredCell;

@end
