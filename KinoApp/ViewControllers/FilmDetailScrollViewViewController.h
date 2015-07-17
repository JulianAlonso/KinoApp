//
//  FilmDetailScrollViewViewController.h
//  KinoApp
//
//  Created by Julian Alonso on 24/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FilmDTO;
@class LoadFilmInteractor;
@class DetailFilmRouter;
@class FetchAllListsInteractor;

@interface FilmDetailScrollViewViewController : UIViewController

@property (nonatomic, strong) DetailFilmRouter *router;
@property (nonatomic, strong) LoadFilmInteractor *loadFilmInteractor;
@property (nonatomic, strong) FetchAllListsInteractor *fetchAllListInteractor;
@property (nonatomic, strong) FilmDTO *film;

@end
