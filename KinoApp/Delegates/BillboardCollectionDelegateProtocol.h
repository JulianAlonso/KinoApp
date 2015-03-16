//
//  BillboardCollectionDelegateProtocol.h
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LoadPlayingNowInteractor;
@class LoadUpcomingFilmsInteractor;

@protocol BillboardCollectionDelegateProtocol <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) LoadPlayingNowInteractor *loadPlayingNowInteractor;
@property (nonatomic, strong) LoadUpcomingFilmsInteractor *loadUpcomingInteractor;
@property (nonatomic, strong) NSArray *cellDelegateClasses;

@property (nonatomic, weak) UICollectionView *billboardCollectionView;
@property (nonatomic, weak) UISegmentedControl *segmentedControl;

- (void)valueChangedAtSelectedControl:(UISegmentedControl *)sender;

@end
