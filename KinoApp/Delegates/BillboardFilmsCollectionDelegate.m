//
//  PlayingNowCollectionDelegate.m
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>
#import "BillboardFilmsCollectionDelegate.h"
#import "CollectionFilmsCollectionViewCell.h"
#import "FilmDTO.h"
#import "BillboardFilmCollectionViewCell.h"
#import "ControllersFactory.h"
#import "FilmCollectionViewCellController.h"
#import "SizeHelper.h"

@interface BillboardFilmsCollectionDelegate () <FilmCollectionViewControllerCellDelegate>

@property (nonatomic, strong) NSArray *films;
@property (nonatomic, strong) NSArray *controllers;

@end

@implementation BillboardFilmsCollectionDelegate

@synthesize interactor = _interactor;
@synthesize filmsCollectionView = _filmsCollectionView;

#pragma mark - UIControlRefresh methods.
- (void)refresh:(UIRefreshControl *)sender
{
    __weak typeof(self) weakSelf = self;
    [self.interactor fetchFilmsWithLocalData:^(NSArray *films) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            strongSelf.films = films;
            [strongSelf.filmsCollectionView reloadData];
        });
        
    } update:^(NSArray *films) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            strongSelf.films = films;
            [strongSelf.filmsCollectionView reloadData];
            [sender endRefreshing];
        });
    }];
}

#pragma mark - Load methods.
- (void)loadControllers
{
    NSMutableArray *controllers = [NSMutableArray array];
    for (__unused FilmDTO *film in self.films)
    {
        FilmCollectionViewCellController *controller = [ControllersFactory controllerForCellClass:[BillboardFilmCollectionViewCell class]];
        controller.delegate = self;
        [controllers addObject:controller];
        
    }
    self.controllers = controllers;
}

#pragma mark - Collection data source methods.
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BillboardFilmCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([BillboardFilmCollectionViewCell class]) forIndexPath:indexPath];
    
    FilmDTO *film = self.films[indexPath.item];
    
    FilmCollectionViewCellController *controller = self.controllers[indexPath.item];
    
    controller.cell = cell;
    controller.film = film;

    return [controller configuredCell];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.films.count;
}

#pragma mark - Controller
- (void)filmCollectionViewCellController:(FilmCollectionViewCellController *)filmTableViewCellController tappedCellWithFilm:(FilmDTO *)film
{
    [self.eventReceiver billboardFilmCollectionViewCellSelectedWithFilmDTO:film];
}

#pragma mark - CollectionView FloatLayout delegate methods.
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
    
    return [SizeHelper sizeForFilmCellWithWidth:width];
}

#pragma mark - Custom setters methods.
- (void)setFilms:(NSArray *)films
{
    _films = films;
    [self loadControllers];
}

@end
