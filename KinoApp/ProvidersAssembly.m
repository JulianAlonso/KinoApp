//
//  ProvidersAssembly.m
//  KinoApp
//
//  Created by Julian Alonso on 15/7/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "ProvidersAssembly.h"
#import "ExternalTMDBProvider.h"
#import "RequestManagerAssembly.h"
#import "LocalCoreDataFilmsProvider.h"
#import "LocalCoreDataListsProvider.h"
#import "TMDBFilmReleasesProvider.h"

@implementation ProvidersAssembly

- (id<ExternalFilmsProvider>)externalFilmsProvider
{
    return [TyphoonDefinition withClass:[ExternalTMDBProvider class] configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(requestManager) with:[_requestManagerAssembly requestManager]];
        [definition injectProperty:@selector(filmReleasesProvider) with:[self filmReleasesProvider]];
    }];
}

- (id<FilmReleasesProvider>)filmReleasesProvider
{
    return [TyphoonDefinition withClass:[TMDBFilmReleasesProvider class] configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(requestManager) with:[_requestManagerAssembly requestManager]];
    }];
}

#pragma mark - Locals Providers methods.
- (id<LocalFilmsProvider>)localFilmsProvider
{
    return [TyphoonDefinition withClass:[LocalCoreDataFilmsProvider class]];
}

- (id<LocalListsProvider>)localListProvider
{
    return [TyphoonDefinition withClass:[LocalCoreDataListsProvider class]];
}

@end
