//
//  ListDTOParser.h
//  KinoApp
//
//  Created by Julian Alonso on 19/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ListDTO;
@class List;

@interface ListDTOParser : NSObject

+ (ListDTO *)listDTOFromList:(List *)list;

+ (NSArray *)listDTOsFromLists:(NSArray *)lists;

@end
