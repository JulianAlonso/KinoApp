//
//  InteractorsAssembly.m
//  KinoApp
//
//  Created by Julian Alonso on 15/7/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "InteractorsAssembly.h"
#import "LoadUpcomingFilmsInteractor.h"
#import "LoadPlayingNowFilmsInteractor.h"
#import "ProvidersAssembly.h"
#import "LoadFilmInteractor.h"
#import "FetchAllListsInteractor.h"
#import "UpdateListInteractor.h"
#import "LoadPopularFilmsInteractor.h"
#import "SearchFilmInteractor.h"

@implementation InteractorsAssembly

- (id<BillboardFilmsInteractor>)loadUpcomingFilmsInteractor
{
    return [TyphoonDefinition withClass:[LoadUpcomingFilmsInteractor class] configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(externalProvider) with:[_providersAssembly externalFilmsProvider]];
        [definition injectProperty:@selector(localProvider) with:[_providersAssembly localFilmsProvider]];
    }];
}

- (id<BillboardFilmsInteractor>)loadPlayingNowFilmsInteractor
{
    return [TyphoonDefinition withClass:[LoadPlayingNowFilmsInteractor class] configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(externalProvider) with:[_providersAssembly externalFilmsProvider]];
        [definition injectProperty:@selector(localProvider) with:[_providersAssembly localFilmsProvider]];
    }];
}

- (LoadFilmInteractor *)loadFilmInteractor
{
    return [TyphoonDefinition withClass:[LoadFilmInteractor class] configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(externalProvider) with:[_providersAssembly externalFilmsProvider]];
        [definition injectProperty:@selector(localProvider) with:[_providersAssembly localFilmsProvider]];
    }];
}

- (FetchAllListsInteractor *)fetchAllListInteractor
{
    return [TyphoonDefinition withClass:[FetchAllListsInteractor class] configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(localListProvider) with:[_providersAssembly localListProvider]];
    }];
}

- (UpdateListInteractor *)updateListInteractor
{
    return [TyphoonDefinition withClass:[UpdateListInteractor class] configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(localListProvider) with:[_providersAssembly localListProvider]];
    }];
}

- (LoadPopularFilmsInteractor *)loadPopularFilmsInteractor
{
    return [TyphoonDefinition withClass:[LoadPopularFilmsInteractor class] configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(externalProvider) with:[_providersAssembly externalFilmsProvider]];
    }];
}

- (SearchFilmInteractor *)searchFilmInteractor
{
    return [TyphoonDefinition withClass:[SearchFilmInteractor class] configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(externalProvider) with:[_providersAssembly externalFilmsProvider]];
    }];
}

@end
