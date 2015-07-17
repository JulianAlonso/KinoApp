//
//  DetailListRouter.h
//  KinoApp
//
//  Created by Julian Alonso on 20/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ListDetailViewController;
@class RouterAssembly;
@class ListDTO;
@class FilmDTO;

@interface DetailListRouter : NSObject

@property (nonatomic, strong) RouterAssembly *routerAssembly;
@property (nonatomic, weak) ListDetailViewController *listDetailViewController;

- (void)presentDetailListViewControllerFrom:(UIViewController *)fromViewController withList:(ListDTO *)list;

- (void)searchButtonPressed;

- (void)tappedCellWithFilm:(FilmDTO *)film;

@end
