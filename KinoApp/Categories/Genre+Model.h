//
//  Genre+Model.h
//  KinoApp
//
//  Created by Julian Alonso on 26/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "Genre.h"

@class GenreDTO;

@interface Genre (Model)

+ (instancetype)genreWithGenreDTO:(GenreDTO *)genreDTO andManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;

@end
