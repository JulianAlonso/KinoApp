//
//  ListCollectionViewCellController.h
//  KinoApp
//
//  Created by Julian Alonso on 18/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ListsCollectionRouter;
@class FilmListCollectionViewCell;
@class ListDTO;

@interface FilmListCollectionViewCellController : NSObject

@property (nonatomic, weak) ListsCollectionRouter *router;
@property (nonatomic, weak) FilmListCollectionViewCell *cell;
@property (nonatomic, strong) ListDTO *list;


- (FilmListCollectionViewCell *)cellConfigured;

@end
