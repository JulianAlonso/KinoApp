//
//  ListDTOParser.m
//  KinoApp
//
//  Created by Julian Alonso on 19/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "ListDTOParser.h"
#import "ListDTO.h"
#import "List.h"
#import "FilmDTOParser.h"

@implementation ListDTOParser

+ (ListDTO *)listDTOFromList:(List *)list
{
    ListDTO *listDTO = [ListDTO new];
    
    listDTO.listName = list.listName;
    listDTO.listFilms = [FilmDTOParser filmDTOsFromFilmsSet:list.listFilms];
    
    return listDTO;
}

+ (NSArray *)listDTOsFromLists:(NSArray *)lists
{
    NSMutableArray *listDTOs = [NSMutableArray array];
    
    for (List *list in lists)
    {
        [listDTOs addObject:[ListDTOParser listDTOFromList:list]];
    }
    
    return listDTOs;
}

@end
