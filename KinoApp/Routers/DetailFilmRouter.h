//
//  DetailFilmRouter.h
//  KinoApp
//
//  Created by Julian Alonso on 18/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FilmDTO;

@interface DetailFilmRouter : UIViewController

- (void)presentFilmDetailViewControllerFrom:(UINavigationController *)navigationController withFilmDTO:(FilmDTO *)film;

@end
