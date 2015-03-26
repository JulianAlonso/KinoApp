//
//  Genre.h
//  KinoApp
//
//  Created by Julian Alonso on 26/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Film;

@interface Genre : NSManagedObject

@property (nonatomic, retain) NSString * genreId;
@property (nonatomic, retain) NSString * genreName;
@property (nonatomic, retain) NSOrderedSet *genreFilms;
@end

@interface Genre (CoreDataGeneratedAccessors)

- (void)insertObject:(Film *)value inGenreFilmsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromGenreFilmsAtIndex:(NSUInteger)idx;
- (void)insertGenreFilms:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeGenreFilmsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInGenreFilmsAtIndex:(NSUInteger)idx withObject:(Film *)value;
- (void)replaceGenreFilmsAtIndexes:(NSIndexSet *)indexes withGenreFilms:(NSArray *)values;
- (void)addGenreFilmsObject:(Film *)value;
- (void)removeGenreFilmsObject:(Film *)value;
- (void)addGenreFilms:(NSOrderedSet *)values;
- (void)removeGenreFilms:(NSOrderedSet *)values;
@end
