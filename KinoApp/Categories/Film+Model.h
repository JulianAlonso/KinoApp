//
//  Film+Model.h
//  KinoApp
//
//  Created by Julian Alonso on 17/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "Film.h"

@class FilmDTO;

extern NSString *const kFilmTypeProperty;

@interface Film (Model)

+ (instancetype)initWithFilmDTO:(FilmDTO *)filmDTO andManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;

@end
