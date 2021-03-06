//
//  ExternalTMDBProvider.h
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExternalFilmsProvider.h"
#import "RequestManager.h"
#import "FilmReleasesProvider.h"

@interface ExternalTMDBProvider : NSObject <ExternalFilmsProvider>

@property (nonatomic, strong) id<RequestManager> requestManager;
@property (nonatomic, strong) id<FilmReleasesProvider> filmReleasesProvider;

@end
