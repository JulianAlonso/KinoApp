//
//  FilmsCollectionDelegate.h
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BillboardFilmsInteractor.h"

@protocol FilmsCollectionDelegate <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) id<BillboardFilmsInteractor> interactor;

@property (nonatomic, weak) UICollectionView *filmsCollectionView;

- (void)refresh:(UIRefreshControl *)sender;

@end
