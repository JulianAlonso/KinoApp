//
//  Genre+Model.m
//  KinoApp
//
//  Created by Julian Alonso on 26/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "Genre+Model.h"
#import "GenreDTO.h"

@implementation Genre (Model)

+ (instancetype)genreWithGenreDTO:(GenreDTO *)genreDTO andManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    Genre *genre = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Genre class]) inManagedObjectContext:managedObjectContext];
    
    genre.genreId = [NSString stringWithFormat:@"%@", genreDTO.genreId];
    genre.genreName = genreDTO.genreName;
    
    return genre;
}

@end
