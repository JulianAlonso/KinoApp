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
@synthesize cellDelegateClasses = _cellDelegateClasses;
@synthesize billboardCollectionView = _billboardCollectionView;


#pragma mark - SegmentedControl methods.
- (void)displaceSegmentedControlTo:(NSUInteger)index
{
    [self.segmentedControl setSelectedSegmentIndex:index];
}

- (void)valueChangedAtSelectedControl:(UISegmentedControl *)sender
{
    CGPoint destiny = CGPointMake(self.billboardCollectionView.frame.size.width * sender.selectedSegmentIndex, 0);
    [self.billboardCollectionView setContentOffset:destiny animated:YES];
}

#pragma mark - Collection Datasourece methods.
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self displaceSegmentedControlTo:indexPath.item];
    CollectionFilmsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CollectionFilmsCollectionViewCell class]) forIndexPath:indexPath];
    
    cell.delegate = [[[self.cellDelegateClasses objectAtIndex:indexPath.item] alloc] init];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return collectionView.frame.size;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}

@end
