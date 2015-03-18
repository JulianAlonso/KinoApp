//
//  Film+Model.h
//  KinoApp
//
//  Created by Julian Alonso on 17/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "Film.h"

@class FilmDTO;

extern NSString *const kFilmIdProperty;
extern NSString *const kFilmTypeProperty;
extern NSString *const kFilmReleaseDateProperty;

@interface Film (Model)

+ (instancetype)filmWithFilmDTO:(FilmDTO *)filmDTO andManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;

@end
