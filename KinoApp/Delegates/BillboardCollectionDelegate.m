//
//  BillboardCollectionDelegate.m
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "BillboardCollectionDelegate.h"
#import "BillboardCollectionViewCell.h"

@interface BillboardCollectionDelegate ()

@property (nonatomic, strong) NSArray *films;

@end

@implementation BillboardCollectionDelegate

@synthesize loadBillboardInteractor = _loadBillboardInteractor;

#pragma mark - RefreshController methods.
- (void)refresh:(UIRefreshControl *)sender
{
    __weak typeof(self) weakSelf = self;
    [self.loadBillboardInteractor loadBillboardFilmsWithCompletionBlock:^(NSArray *films) {
        __strong typeof(weakSelf) strongSelf = self;
        
        strongSelf.films = films;
        
        [sender endRefreshing];
        
        [strongSelf.billBoardCollection reloadData];
    }];
}

#pragma mark - Collection Datasourece methods.
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BillboardCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([BillboardCollectionViewCell class]) forIndexPath:indexPath];
    
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

@end
