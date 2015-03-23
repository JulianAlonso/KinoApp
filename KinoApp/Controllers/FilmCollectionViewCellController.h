//
//  FilmTableViewCellController.h
//  KinoApp
//
//  Created by Julian Alonso on 20/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BillboardFilmCollectionViewCell;
@class FilmDTO;
@class FilmCollectionViewCellController;

@protocol FilmCollectionViewControllerCellDelegate <NSObject>

- (void)filmCollectionViewCellController:(FilmCollectionViewCellController *)filmTableViewCellController tappedCellWithFilm:(FilmDTO *)film;

@end

@interface FilmCollectionViewCellController : NSObject

@property (nonatomic, strong) FilmDTO *film;
@property (nonatomic, weak)  BillboardFilmCollectionViewCell *cell;
@property (nonatomic, weak) id<FilmCollectionViewControllerCellDelegate> delegate;

- (BillboardFilmCollectionViewCell *)configuredCell;

@end
