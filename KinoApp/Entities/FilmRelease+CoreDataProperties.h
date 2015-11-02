//
//  FilmRelease+CoreDataProperties.h
//  
//
//  Created by Julian Alonso on 28/10/15.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "FilmRelease.h"

NS_ASSUME_NONNULL_BEGIN

@interface FilmRelease (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *releaseCertification;
@property (nullable, nonatomic, retain) NSString *releaseCountryISO;
@property (nullable, nonatomic, retain) NSDate *releaseDate;
@property (nullable, nonatomic, retain) Film *releaseFilm;

@end

NS_ASSUME_NONNULL_END
