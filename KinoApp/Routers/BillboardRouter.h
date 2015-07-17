//
//  BillboardRouter.h
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewControllersAssembly;
@class RouterAssembly;
@class FilmDTO;

@interface BillboardRouter : NSObject

@property (nonatomic, strong) RouterAssembly *routerAssembly;
@property (nonatomic, strong) ViewControllersAssembly *viewControllersAssembly;

- (void)loadViewAt:(UITabBarController *)tabBarController;

- (void)selectedCellWithFilmDTO:(FilmDTO *)filmDTO fromViewController:(UIViewController *)fromViewController;

@end
