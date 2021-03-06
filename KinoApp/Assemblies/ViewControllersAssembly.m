//
//  ViewControllersAssembly.m
//  KinoApp
//
//  Created by Julian Alonso on 15/7/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "ViewControllersAssembly.h"
#import "BillboardViewController.h"
#import "RouterAssembly.h"
#import "DelegatesAssembly.h"
#import "FilmDetailScrollViewViewController.h"
#import "ListDetailViewController.h"
#import "InteractorsAssembly.h"
#import "SearchFilmViewController.h"
#import "ListsCollectionViewController.h"
#import "ControllersAssembly.h"

@implementation ViewControllersAssembly

- (BillboardViewController *)billboardViewController
{
    return [TyphoonDefinition withClass:[BillboardViewController class] configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(delegate) with:[_delegateAssembly billboardDelegate]];
    }];
}

- (FilmDetailScrollViewViewController *)filmDetailScrollViewController
{
    return [TyphoonDefinition withClass:[FilmDetailScrollViewViewController class] configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(fetchAllListInteractor) with:[_interactorsAssembly fetchAllListInteractor]];
        [definition injectProperty:@selector(loadFilmInteractor) with:[_interactorsAssembly loadFilmInteractor]];
        [definition injectProperty:@selector(controllersAssembly) with:_controllersAssembly];
    }];
}

- (ListsCollectionViewController *)listsCollectionViewController
{
    return [TyphoonDefinition withClass:[ListsCollectionViewController class] configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(fetchAllListsInteractor) with:[_interactorsAssembly fetchAllListInteractor]];
        [definition injectProperty:@selector(controllersAssembly) with:_controllersAssembly];
    }];
}

- (ListDetailViewController *)listDetailViewController
{
    return [TyphoonDefinition withClass:[ListDetailViewController class] configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(updateListInteractor) with:[_interactorsAssembly updateListInteractor]];
        [definition injectProperty:@selector(controllersAssembly) with:_controllersAssembly];
    }];
}

- (SearchFilmViewController *)searchFilmViewController
{
    return [TyphoonDefinition withClass:[SearchFilmViewController class] configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(searchInteractor) with:[_interactorsAssembly searchFilmInteractor]];
        [definition injectProperty:@selector(popularInteractor) with:[_interactorsAssembly loadPopularFilmsInteractor]];
    }];
}

@end
