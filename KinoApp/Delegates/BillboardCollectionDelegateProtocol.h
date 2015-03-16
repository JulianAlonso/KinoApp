//
//  BillboardCollectionDelegateProtocol.h
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LoadBillboardInteractor;

@protocol BillboardCollectionDelegateProtocol <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) LoadBillboardInteractor *loadBillboardInteractor;


- (void)refresh:(UIRefreshControl *)sender;

@end
