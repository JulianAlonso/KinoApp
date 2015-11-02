//
//  ViewControllersAssembly.h
//  KinoApp
//
//  Created by Julian Alonso on 15/7/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "TyphoonAssembly.h"

@class RouterAssembly;
@class DelegatesAssembly;
@class BillboardViewController;
@class FilmDetailScrollViewViewController;
@class ListsCollectionViewController;
@class ListDetailViewController;
@class InteractorsAssembly;
@class SelectListViewController;
@class SearchFilmViewController;
@class ControllersAssembly;

@interface ViewControllersAssembly : TyphoonAssembly

@property (nonatomic, strong, readonly) RouterAssembly *routerAssembly;
@property (nonatomic, strong, readonly) DelegatesAssembly *delegateAssembly;
@property (nonatomic, strong, readonly) InteractorsAssembly *interactorsAssembly;
@property (nonatomic, strong, readonly) ControllersAssembly *controllersAssembly;

- (BillboardViewController *)billboardViewController;
- (FilmDetailScrollViewViewController *)filmDetailScrollViewController;
- (ListsCollectionViewController *)listsCollectionViewController;
- (ListDetailViewController *)listDetailViewController;
- (SelectListViewController *)selectListViewController;
- (SearchFilmViewController *)searchFilmViewController;

@end
