//
//  RouterAssembly.m
//  KinoApp
//
//  Created by Julian Alonso on 15/7/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "RouterAssembly.h"
#import "MainRouter.h"
#import "BillboardRouter.h"
#import "ListsCollectionRouter.h"
#import "DetailFilmRouter.h"
#import "ViewControllersAssembly.h"
#import "DetailListRouter.h"
#import "SearchFilmRouter.h"
#import "SelectListRouter.h"

@implementation RouterAssembly

- (MainRouter *)mainRouter
{
    return [TyphoonDefinition withClass:[MainRouter class] configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(routerAssembly) with:self];
    }];
}

- (BillboardRouter *)billboardRouter
{
    return [TyphoonDefinition withClass:[BillboardRouter class] configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(routerAssembly) with:self];
        [definition injectProperty:@selector(viewControllersAssembly) with:_viewControllersAssembly];
    }];
}

- (ListsCollectionRouter *)listsCollectionRouter
{
    return [TyphoonDefinition withClass:[ListsCollectionRouter class] configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(routerAssembly) with:self];
        [definition injectProperty:@selector(viewControllersAssembly) with:self];
    }];
}

- (DetailFilmRouter *)detailFilmRouter
{
    return [TyphoonDefinition withClass:[DetailFilmRouter class] configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(filmDetailScrollViewController) with:[_viewControllersAssembly filmDetailScrollViewController]];
    }];
}

- (DetailListRouter *)detailListRouter
{
    return [TyphoonDefinition withClass:[DetailListRouter class] configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(routerAssembly) with:self];
        [definition injectProperty:@selector(viewControllersAssembly) with:_viewControllersAssembly];
    }];
}

- (SearchFilmRouter *)searchFilmRouter
{
    return [TyphoonDefinition withClass:[SearchFilmRouter class] configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(routerAssembly) with:self];
        [definition injectProperty:@selector(searchFilmViewController) with:[_viewControllersAssembly searchFilmViewController]];
    }];
}

- (SelectListRouter *)selectListRouter
{
    return [TyphoonDefinition withClass:[SelectListRouter class] configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(selectListViewController) with:[_viewControllersAssembly selectListViewController]];
    }];
}

@end
