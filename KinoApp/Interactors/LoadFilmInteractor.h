//
//  LoadFilmInteractor.h
//  KinoApp
//
//  Created by Julian Alonso on 18/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExternalFilmsProvider.h"
#import "LocalFilmsProvider.h"

@class FilmDTO;

@interface LoadFilmInteractor : UIViewController

@property (nonatomic, strong) id<ExternalFilmsProvider> externalProvider;
@property (nonatomic, strong) id<LocalFilmsProvider> localProvider;

- (void)loadFilmWithId:(NSString *)filmId completion:(void(^)(FilmDTO *film))completion update:(void(^)(FilmDTO *film))update;

@end
