//
//  LocalListsProvider.h
//  KinoApp
//
//  Created by Julian Alonso on 18/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FilmDTO;
@class ListDTO;

@protocol LocalListsProvider <NSObject>

- (void)fetchAllListsWithCompletion:(void(^)(NSArray *films))completion;

- (void)addFilm:(FilmDTO *)film toList:(ListDTO *)list completion:(void(^)(NSError *error))completion;

@end
