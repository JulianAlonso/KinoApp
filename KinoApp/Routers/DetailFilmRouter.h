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
@class ViewControllersAssembly;
@class FilmDetailScrollViewViewController;

@interface DetailFilmRouter : UIViewController

@property (nonatomic, strong) ViewControllersAssembly *viewControllersAssembly;
@property (nonatomic, weak) FilmDetailScrollViewViewController *filmDetailScrollViewController;


- (void)presentFilmDetailViewControllerFrom:(UINavigationController *)navigationController withFilmDTO:(FilmDTO *)film;

- (void)popFilmDetailViewController;

@end
