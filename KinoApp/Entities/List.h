//
//  List.h
//  KinoApp
//
//  Created by Julian Alonso on 19/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Film;

@interface List : NSManagedObject

@property (nonatomic, retain) NSString * listName;
@property (nonatomic, retain) NSSet *listFilms;
@end

@interface List (CoreDataGeneratedAccessors)

- (void)addListFilmsObject:(Film *)value;
- (void)removeListFilmsObject:(Film *)value;
- (void)addListFilms:(NSSet *)values;
- (void)removeListFilms:(NSSet *)values;

@end
