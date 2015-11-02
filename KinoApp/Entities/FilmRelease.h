//
//  FilmRelease.h
//  
//
//  Created by Julian Alonso on 28/10/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Film;

@class FilmReleaseDTO;
NS_ASSUME_NONNULL_BEGIN

@interface FilmRelease : NSManagedObject

+ (instancetype)filmReleaseWithFilmReleaseDTO:(FilmReleaseDTO *)filmReleaseDTO andManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;

@end

NS_ASSUME_NONNULL_END

#import "FilmRelease+CoreDataProperties.h"
