//
//  FilmCollectionsInTableView.h
//  KinoApp
//
//  Created by Julian Alonso on 27/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FilmDTO;
@class FetchAllListsInteractor;
@class ControllersAssembly;

@interface FilmCollectionsInTableView : UITableView

@property (nonatomic, strong) FilmDTO *film;
@property (nonatomic, strong) FetchAllListsInteractor *fetchListsInteractor;
@property (nonatomic, strong) ControllersAssembly *controllersAssembly;

@end
