//
//  Film.h
//  KinoApp
//
//  Created by Julian Alonso on 22/7/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@class Genre, List, FilmRelease;

NS_ASSUME_NONNULL_BEGIN

@interface Film : NSManagedObject

@end

NS_ASSUME_NONNULL_END

#import "Film+CoreDataProperties.h"
