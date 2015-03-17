//
//  UpcomingCollectionDelegate.m
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>
#import "UpcomingCollectionDelegate.h"
#import "BillboardCollectionViewCell.h"
#import "FilmDTO.h"

@interface UpcomingCollectionDelegate ()

@property (nonatomic, strong) NSArray *films;

@end

@implementation UpcomingCollectionDelegate

@synthesize interactor = _interactor;
@synthesize filmsCollectionView = _filmsCollectionView;

#pragma mark - UIControlRefresh methods.
- (void)refresh:(UIRefreshControl *)sender
{
    NSLog(@"Refresing");
    __weak typeof(self) weakSelf = self;
    [self.interactor fetchFilmsWithComplectionBlock:^(NSArray *films) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
        strongSelf.films = films;
        [strongSelf.filmsCollectionView reloadData];
        
        [sender endRefreshing];
    }];
    

}

#pragma mark - Collection data source methods.
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BillboardCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([BillboardCollectionViewCell class]) forIndexPath:indexPath];

    FilmDTO *film = self.films[indexPath.item];
    
    cell.filmTitleLabel.text = film.filmTitle;
    
    [cell.filmImageView sd_setImageWithURL:[NSURL URLWithString:film.filmPosterPath] placeholderImage:nil];
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.films.count;
}

#pragma mark - CollectionView FlowLayout delegate methods.
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = CGRectGetWidth(collectionView.bounds) /2;
    CGFloat height = CGRectGetHeight(collectionView.bounds) /2;
    
    return CGSizeMake(width, height);
}

@end
