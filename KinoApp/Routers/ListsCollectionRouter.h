//
//  ListsCollectionRouter.h
//  KinoApp
//
//  Created by Julian Alonso on 18/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ListDTO;

@interface ListsCollectionRouter : NSObject

- (void)loadViewAt:(UITabBarController *)tabBarCotroller;

- (void)tapAtCellWithListDTO:(ListDTO *)list;

@end
