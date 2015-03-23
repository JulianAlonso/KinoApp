//
//  BillboardCollectionDelegate.m
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "BillboardCollectionDelegate.h"
#import "CollectionFilmsCollectionViewCell.h"
#import "UIColor+Custom.h"

@interface BillboardCollectionDelegate ()

@property (nonatomic, strong) NSArray *films;

@end

@implementation BillboardCollectionDelegate

@synthesize markerViewLeftSpace = _markerViewLeftSpace;
@synthesize loadPlayingNowInteractor = _loadPlayingNowInteractor;
@synthesize loadUpcomingInteractor = _loadUpcomingInteractor;
@synthesize cellDelegates = _cellDelegates;
@synthesize billboardCollectionView = _billboardCollectionView;
@synthesize playingNowLabel = _playingNowLabel;
@synthesize upcomingLabel = _upcomingLabel;

- (void)upcomingLabelPressed:(UILabel *)sender
{
    CGFloat upcomingRef = self.billboardCollectionView.frame.size.width;
    [self.billboardCollectionView setContentOffset:CGPointMake(upcomingRef, 0) animated:YES];
    [self selectedUpcomingLabel];
}
- (void)playingNowLabelPressed:(UILabel *)sender
{
    CGFloat playingNowRef = 0;
    [self.billboardCollectionView setContentOffset:CGPointMake(playingNowRef, 0) animated:YES];
    [self selectedPlayingNowLabel];
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
    CollectionFilmsCollectionViewCell *filmCell = (CollectionFilmsCollectionViewCell *)cell;
    [filmCell refreshActivated:nil];
}

#pragma mark - ScrollView delegate methods.
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat index = (scrollView.contentOffset.x / CGRectGetWidth(scrollView.frame));
    if (index == 0)
    {
        [self selectedPlayingNowLabel];
    }
    else
    {
        [self selectedUpcomingLabel];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat movedContent = scrollView.contentOffset.x;
    [UIView animateWithDuration:0.1f animations:^{
        self.markerViewLeftSpace.constant = movedContent / 2;
    }];
}

#pragma mark - OWN methods.
- (void)selectedUpcomingLabel
{
    [self.upcomingLabel setTextColor:[UIColor selectedItemColor]];
    [self.playingNowLabel setTextColor:[UIColor unselectedItemColor]];
}

- (void)selectedPlayingNowLabel
{
    [self.playingNowLabel setTextColor:[UIColor selectedItemColor]];
    [self.upcomingLabel setTextColor:[UIColor unselectedItemColor]];
}

@end
