//
//  PlayingNowCollectionDelegate.m
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "PlayingNowCollectionDelegate.h"
#import "CollectionFilmsCollectionViewCell.h"
#import "BillboardCollectionViewCell.h"

@implementation PlayingNowCollectionDelegate

@synthesize interactor = _interactor;
@synthesize filmsCollectionView = _filmsCollectionView;

#pragma mark - UIControlRefresh methods.
- (void)refresh:(UIRefreshControl *)sender
{
    NSLog(@"Refresing");
    
    [self.interactor fetchFilmsWithComplectionBlock:^(NSArray *films) {
        NSLog(@"Fetching from playing now delegate");
    }];
    
    [sender endRefreshing];
}

#pragma mark - Collection data source methods.
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BillboardCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([BillboardCollectionViewCell class]) forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 40;
}

@end
