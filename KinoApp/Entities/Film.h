//
//  Film.h
//  KinoApp
//
//  Created by Julian Alonso on 17/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Film : NSManagedObject

@property (nonatomic, retain) NSString * filmId;
@property (nonatomic, retain) NSString * filmOriginalTitle;
@property (nonatomic, retain) NSString * filmTitle;
@property (nonatomic, retain) NSString * filmReleaseDate;
@property (nonatomic, retain) NSString * filmHomepage;
@property (nonatomic, retain) NSString * filmOverview;
@property (nonatomic, retain) NSString * filmPosterPath;
@property (nonatomic, retain) NSString * filmTagline;
@property (nonatomic, retain) NSString * filmBackdropPath;

@end
