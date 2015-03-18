//
//  BillboardCollectionDelegate.m
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "BillboardCollectionDelegate.h"
#import "CollectionFilmsCollectionViewCell.h"



@interface BillboardCollectionDelegate ()

@property (nonatomic, strong) NSArray *films;

@end

@implementation BillboardCollectionDelegate

@synthesize segmentedControl = _segmentedControl;
@synthesize loadPlayingNowInteractor = _loadPlayingNowInteractor;
@synthesize loadUpcomingInteractor = _loadUpcomingInteractor;
@synthesize cellDelegates = _cellDelegates;
@synthesize billboardCollectionView = _billboardCollectionView;


- (void)valueChangedAtSelectedControl:(UISegmentedControl *)sender
{
    CGPoint destiny = CGPointMake(self.billboardCollectionView.frame.size.width * sender.selectedSegmentIndex, 0);
    [self.billboardCollectionView setContentOffset:destiny animated:YES];
}

#pragma mark - Collection Datasourece methods.
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionFilmsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CollectionFilmsCollectionViewCell class]) forIndexPath:indexPath];
    
    cell.delegate = self.cellDelegates[indexPath.item];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return collectionView.frame.size;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.cellDelegates.count;
}

#pragma mark - CollectionView Delegate methods.
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
//    CollectionFilmsCollectionViewCell *filmCell = (CollectionFilmsCollectionViewCell *)cell;
//    [filmCell refreshActivated:nil];
}

#pragma mark - ScrollView delegate methods.
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat index = scrollView.contentOffset.x / scrollView.bounds.size.width;
    [self.segmentedControl setSelectedSegmentIndex:index];
}

@end
