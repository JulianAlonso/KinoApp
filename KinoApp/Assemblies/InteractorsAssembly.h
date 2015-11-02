//
//  InteractorsAssembly.h
//  KinoApp
//
//  Created by Julian Alonso on 15/7/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "TyphoonAssembly.h"
#import "BillboardFilmsInteractor.h"

@class ProvidersAssembly;
@class LoadFilmInteractor;
@class FetchAllListsInteractor;
@class UpdateListInteractor;
@class LoadPopularFilmsInteractor;
@class SearchFilmInteractor;
@class AddFilmToListInteractor;
@class RemoveFilmFromListInteractor;

@interface InteractorsAssembly : TyphoonAssembly

@property (nonatomic, strong, readonly) ProvidersAssembly *providersAssembly;

- (id<BillboardFilmsInteractor>)loadUpcomingFilmsInteractor;

- (id<BillboardFilmsInteractor>)loadPlayingNowFilmsInteractor;

- (LoadFilmInteractor *)loadFilmInteractor;

- (FetchAllListsInteractor *)fetchAllListInteractor;

- (UpdateListInteractor *)updateListInteractor;

- (LoadPopularFilmsInteractor *)loadPopularFilmsInteractor;

- (SearchFilmInteractor *)searchFilmInteractor;

- (AddFilmToListInteractor *)addFilmToListInteractor;

- (RemoveFilmFromListInteractor *)removeFilmFromListInteractor;

@end
