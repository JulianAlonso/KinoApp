//
//  FilmsCollectionDelegate.h
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BillboardFilmsInteractor.h"
#import "BillboardRouter.h"

@protocol FilmsCollectionDelegate <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) id<BillboardFilmsInteractor> interactor;
@property (nonatomic, strong) BillboardRouter *router;

@property (nonatomic, weak) UICollectionView *filmsCollectionView;

- (void)refresh:(UIRefreshControl *)sender;

@end
