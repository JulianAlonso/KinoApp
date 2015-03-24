//
//  FilmDetailTableViewCellFactory.h
//  KinoApp
//
//  Created by Julian Alonso on 24/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DetailFilmTableViewCellController.h"

@interface FilmDetailTableViewCellFactory : NSObject

+ (Class)cellClassForIndexpath:(NSIndexPath *)indexpath;

+ (id<DetailFilmTableViewCellController>)controllerForCellClass:(Class)clazz;

@end
