//
//  FilmDetailViewController.h
//  KinoApp
//
//  Created by Julian Alonso on 18/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FilmDTO;
@class DetailFilmRouter;
@class LoadFilmInteractor;
@class AddFilmToListInteractor;
@class ListDTO;

@interface FilmDetailViewController : UIViewController

@property (nonatomic, strong) DetailFilmRouter *router;
@property (nonatomic, strong) FilmDTO *film;

@property (nonatomic, strong) LoadFilmInteractor *interactor;

- (void)saveFilmToList:(ListDTO *)list;

@end
