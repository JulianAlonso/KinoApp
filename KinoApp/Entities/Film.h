//
//  Film.h
//  KinoApp
//
//  Created by Julian Alonso on 26/3/15.
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
@property (nonatomic, retain) NSString * filmReleaseDate;
@property (nonatomic, retain) NSString * filmRuntime;
@property (nonatomic, retain) NSString * filmTagline;
@property (nonatomic, retain) NSString * filmTitle;
@property (nonatomic, retain) NSString * filmType;
@property (nonatomic, retain) NSSet *filmLists;
@property (nonatomic, retain) NSOrderedSet *filmGenres;
@end

@interface Film (CoreDataGeneratedAccessors)

- (void)addFilmListsObject:(List *)value;
- (void)removeFilmListsObject:(List *)value;
- (void)addFilmLists:(NSSet *)values;
- (void)removeFilmLists:(NSSet *)values;

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
@end
