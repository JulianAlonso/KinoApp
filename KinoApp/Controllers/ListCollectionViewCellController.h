//
//  ListCollectionViewCellController.h
//  KinoApp
//
//  Created by Julian Alonso on 18/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ListCollectionViewCell;
@class ListDTO;

@interface ListCollectionViewCellController : NSObject

@property (nonatomic, weak) ListCollectionViewCell *cell;
@property (nonatomic, strong) ListDTO *list;

- (ListCollectionViewCell *)cellConfigured;

@end
