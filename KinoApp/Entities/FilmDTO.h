//
//  FilmDTO.h
//  KinoApp
//
//  Created by Julian Alonso on 17/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const TYPE_PLAYIN_NOW;
extern NSString *const TYPE_UPCOMING;

@interface FilmDTO : NSObject

@property (nonatomic, strong) NSString *filmId;
@property (nonatomic, strong) NSString *filmOriginalTitle;
@property (nonatomic, strong) NSString *filmTitle;
@property (nonatomic, strong) NSString *filmReleaseDate;
@property (nonatomic, strong) NSString *filmHomepage;
@property (nonatomic, strong) NSString *filmOverview;
@property (nonatomic, strong) NSString *filmTagline;
@property (nonatomic, strong) NSString *filmPosterPath;
@property (nonatomic, strong) NSString *filmBackdropPath;
@property (nonatomic, strong) NSString *filmType;

@end