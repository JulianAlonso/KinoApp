//
//  InteractorsFactory.h
//  KinoApp
//
//  Created by Julian Alonso on 25/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FetchAllListsInteractor;
@class AddFilmToListInteractor;
@class RemoveFilmFromListInteractor;

@interface InteractorsFactory : NSObject

+ (FetchAllListsInteractor *)fetchAllListsInteractor;

+ (AddFilmToListInteractor *)addFilmToListInteractor;

+ (RemoveFilmFromListInteractor *)removeFilmFromListInteractor;

@end
