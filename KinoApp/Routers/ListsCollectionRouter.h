//
//  ListsCollectionRouter.h
//  KinoApp
//
//  Created by Julian Alonso on 18/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RouterAssembly;
@class ViewControllersAssembly;
@class ListsCollectionViewController;
@class ListDTO;

@interface ListsCollectionRouter : NSObject

@property (nonatomic, strong) ViewControllersAssembly *viewControllersAssembly;
@property (nonatomic, strong) RouterAssembly *routerAssembly;
@property (nonatomic, weak) ListsCollectionViewController *listsCollectionViewController;

- (void)loadViewAt:(UITabBarController *)tabBarCotroller;
- (void)tapAtCellWithListDTO:(ListDTO *)list;

@end
