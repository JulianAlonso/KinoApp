//
//  CollectionFilmsCollectionViewCell.h
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilmsCollectionDelegate.h"

@interface CollectionFilmsCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) id<FilmsCollectionDelegate> delegate;
@property (nonatomic, strong) UIRefreshControl *refreshControl;


- (void)refreshActivated:(UIRefreshControl *)sender;

@end
