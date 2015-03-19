//
//  ListCollectionViewCell.h
//  KinoApp
//
//  Created by Julian Alonso on 18/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ListCollectionViewCellController;

@interface ListCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) ListCollectionViewCellController *controller;

@end
