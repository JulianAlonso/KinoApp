//
//  ListDTO.h
//  KinoApp
//
//  Created by Julian Alonso on 18/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FilmDTO;

extern NSString *const kListNameProperty;

@interface ListDTO : NSObject

@property (nonatomic, strong) NSString *listName;
@property (nonatomic, strong) NSArray *listFilms;

@end
