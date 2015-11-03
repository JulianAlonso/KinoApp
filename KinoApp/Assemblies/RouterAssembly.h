//
//  RouterAssembly.h
//  KinoApp
//
//  Created by Julian Alonso on 15/7/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "TyphoonAssembly.h"

@class ViewControllersAssembly;
@class MainRouter;
@class BillboardRouter;
@class ListsCollectionRouter;
@class DetailFilmRouter;
@class DetailListRouter;
@class SearchFilmRouter;

@interface RouterAssembly : TyphoonAssembly

@property (nonatomic, strong, readonly) ViewControllersAssembly *viewControllersAssembly;

- (MainRouter *)mainRouter;

- (BillboardRouter *)billboardRouter;

- (ListsCollectionRouter *)listsCollectionRouter;

- (DetailFilmRouter *)detailFilmRouter;

- (DetailListRouter *)detailListRouter;

- (SearchFilmRouter *)searchFilmRouter;

@end
