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

@implementation ProvidersAssembly

- (id<ExternalFilmsProvider>)externalFilmsProvider
{
    return [TyphoonDefinition withClass:[ExternalTMDBProvider class] configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(requestManager) with:[_requestManagerAssembly requestManager]];
    }];
}

- (id<LocalFilmsProvider>)localFilmsProvider
{
    return [TyphoonDefinition withClass:[LocalCoreDataFilmsProvider class] configuration:^(TyphoonDefinition *definition)
    {
        //No Dependencies at this moment, but probably if the coredata stack is injected by typhoon, the dependency will be here.
    }];
}

- (id<LocalListsProvider>)localListProvider
{
    return [TyphoonDefinition withClass:[LocalCoreDataListsProvider class] configuration:^(TyphoonDefinition *definition)
    {
        // The same as above
    }];
}

@end
