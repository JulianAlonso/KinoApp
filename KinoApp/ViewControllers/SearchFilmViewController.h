//
//  SearchViewController.h
//  KinoApp
//
//  Created by Julian Alonso on 20/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ListDTO;
@class LoadPopularFilmsInteractor;
@class SearchFilmRouter;
@class SearchFilmInteractor;

@interface SearchFilmViewController : UIViewController

@property (nonatomic, strong) SearchFilmInteractor *searchInteractor;
@property (nonatomic, strong) LoadPopularFilmsInteractor *popularInteractor;
@property (nonatomic, strong) SearchFilmRouter *router;

@property (nonatomic, strong) ListDTO *fromList;

@end
