//
//  Film+CoreDataProperties.h
//  
//
//  Created by Julian Alonso on 28/10/15.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Film.h"

NS_ASSUME_NONNULL_BEGIN

@interface Film (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *filmBackdropPath;
@property (nullable, nonatomic, retain) NSString *filmHomepage;
@property (nullable, nonatomic, retain) NSString *filmId;
@property (nullable, nonatomic, retain) NSString *filmOriginalTitle;
@property (nullable, nonatomic, retain) NSString *filmOverview;
@property (nullable, nonatomic, retain) NSString *filmPosterPath;
@property (nullable, nonatomic, retain) NSDate *filmReleaseDate;
@property (nullable, nonatomic, retain) NSString *filmRuntime;
@property (nullable, nonatomic, retain) NSString *filmTagline;
@property (nullable, nonatomic, retain) NSString *filmTitle;
@property (nullable, nonatomic, retain) NSString *filmType;
@property (nullable, nonatomic, retain) NSOrderedSet<Genre *> *filmGenres;
@property (nullable, nonatomic, retain) NSSet<List *> *filmLists;
@property (nullable, nonatomic, retain) NSSet<FilmRelease *> *filmReleases;

@end

@interface Film (CoreDataGeneratedAccessors)

- (void)insertObject:(Genre *)value inFilmGenresAtIndex:(NSUInteger)idx;
- (void)removeObjectFromFilmGenresAtIndex:(NSUInteger)idx;
- (void)insertFilmGenres:(NSArray<Genre *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeFilmGenresAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInFilmGenresAtIndex:(NSUInteger)idx withObject:(Genre *)value;
- (void)replaceFilmGenresAtIndexes:(NSIndexSet *)indexes withFilmGenres:(NSArray<Genre *> *)values;
- (void)addFilmGenresObject:(Genre *)value;
- (void)removeFilmGenresObject:(Genre *)value;
- (void)addFilmGenres:(NSOrderedSet<Genre *> *)values;
- (void)removeFilmGenres:(NSOrderedSet<Genre *> *)values;

- (void)addFilmListsObject:(List *)value;
- (void)removeFilmListsObject:(List *)value;
- (void)addFilmLists:(NSSet<List *> *)values;
- (void)removeFilmLists:(NSSet<List *> *)values;

- (void)addFilmReleasesObject:(NSManagedObject *)value;
- (void)removeFilmReleasesObject:(NSManagedObject *)value;
- (void)addFilmReleases:(NSSet<NSManagedObject *> *)values;
- (void)removeFilmReleases:(NSSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
