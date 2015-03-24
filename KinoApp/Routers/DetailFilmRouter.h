//
//  DetailFilmRouter.h
//  KinoApp
//
//  Created by Julian Alonso on 18/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FilmDTO;
@class ListDTO;

@interface DetailFilmRouter : UIViewController

- (void)presentFilmDetailViewControllerFrom:(UINavigationController *)navigationController withFilmDTO:(FilmDTO *)film;

- (void)addButtonPressedFrom:(UIViewController *)fromViewController withFilmDTO:(FilmDTO *)film;

- (void)dismissedSelectListViewControllerWithSelectedList:(ListDTO *)list;

- (void)popFilmDetailViewController;

@end
