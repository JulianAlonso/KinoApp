//
//  FilmRelease.m
//  
//
//  Created by Julian Alonso on 28/10/15.
//
//

#import "FilmRelease.h"
#import "Film.h"
#import "FilmReleaseDTO.h"

@implementation FilmRelease

+ (instancetype)filmReleaseWithFilmReleaseDTO:(FilmReleaseDTO *)filmReleaseDTO andManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
	FilmRelease *filmRelease = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([self class])
                                                             inManagedObjectContext:managedObjectContext];
    
    if (filmRelease)
    {
        filmRelease.releaseCertification = filmReleaseDTO.releaseCertification;
        filmRelease.releaseCountryISO = filmReleaseDTO.releaseCountryISO;
        filmRelease.releaseDate = filmReleaseDTO.releaseDate;
    }
    
    return filmRelease;
}


@end
