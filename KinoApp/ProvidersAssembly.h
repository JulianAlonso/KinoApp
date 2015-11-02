//
//  ProvidersAssembly.h
//  KinoApp
//
//  Created by Julian Alonso on 15/7/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "TyphoonAssembly.h"
#import "ExternalFilmsProvider.h"
#import "LocalFilmsProvider.h"
#import "LocalListsProvider.h"
#import "FilmReleasesProvider.h"

@class RequestManagerAssembly;

@interface ProvidersAssembly : TyphoonAssembly

@property (nonatomic, strong, readonly) RequestManagerAssembly *requestManagerAssembly;

- (id<ExternalFilmsProvider>)externalFilmsProvider;
- (id<FilmReleasesProvider>)filmReleasesProvider;
- (id<LocalFilmsProvider>)localFilmsProvider;
- (id<LocalListsProvider>)localListProvider;

@end
