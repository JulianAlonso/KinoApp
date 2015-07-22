//
//  Film.h
//  KinoApp
//
//  Created by Julian Alonso on 22/7/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Genre, List;

@interface Film : NSManagedObject

@property (nonatomic, retain) NSString * filmBackdropPath;
@property (nonatomic, retain) NSString * filmHomepage;
@property (nonatomic, retain) NSString * filmId;
@property (nonatomic, retain) NSString * filmOriginalTitle;
@property (nonatomic, retain) NSString * filmOverview;
@property (nonatomic, retain) NSString * filmPosterPath;
@property (nonatomic, retain) NSDate * filmReleaseDate;
@property (nonatomic, retain) NSString * filmRuntime;
@property (nonatomic, retain) NSString * filmTagline;
@property (nonatomic, retain) NSString * filmTitle;
@property (nonatomic, retain) NSString * filmType;
@property (nonatomic, retain) NSOrderedSet *filmGenres;
@property (nonatomic, retain) NSSet *filmLists;
@end

@interface Film (CoreDataGeneratedAccessors)

- (void)insertObject:(Genre *)value inFilmGenresAtIndex:(NSUInteger)idx;
- (void)removeObjectFromFilmGenresAtIndex:(NSUInteger)idx;
- (void)insertFilmGenres:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeFilmGenresAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInFilmGenresAtIndex:(NSUInteger)idx withObject:(Genre *)value;
- (void)replaceFilmGenresAtIndexes:(NSIndexSet *)indexes withFilmGenres:(NSArray *)values;
- (void)addFilmGenresObject:(Genre *)value;
- (void)removeFilmGenresObject:(Genre *)value;
- (void)addFilmGenres:(NSOrderedSet *)values;
- (void)removeFilmGenres:(NSOrderedSet *)values;
- (void)addFilmListsObject:(List *)value;
- (void)removeFilmListsObject:(List *)value;
- (void)addFilmLists:(NSSet *)values;
- (void)removeFilmLists:(NSSet *)values;

@end
