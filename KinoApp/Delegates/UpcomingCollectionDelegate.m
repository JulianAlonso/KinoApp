//
//  UpcomingCollectionDelegate.m
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "UpcomingCollectionDelegate.h"
#import "BillboardCollectionViewCell.h"

@implementation UpcomingCollectionDelegate

@synthesize interactor = _interactor;
@synthesize filmsCollectionView = _filmsCollectionView;

#pragma mark - UIControlRefresh methods.
- (void)refresh:(UIRefreshControl *)sender
{
    NSLog(@"Refresing");
    
    [self.interactor fetchFilmsWithComplectionBlock:^(NSArray *films) {
        NSLog(@"Fetching from upcoming delegate.");
    }];
    
    [sender endRefreshing];
}

#pragma mark - Collection data source methods.
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BillboardCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([BillboardCollectionViewCell class]) forIndexPath:indexPath];

    cell.backgroundColor = [UIColor greenColor];
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 50;
}

@end
