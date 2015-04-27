//
//  FilmGenresCollectionView.m
//  KinoApp
//
//  Created by Julian Alonso on 27/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "FilmGenresCollectionView.h"
#import "FilmDTO.h"
#import "GenreFilmDetailCollectionViewCell.h"
#import "FilmDetailGenreCollectionViewCellController.h"
#import "SizeHelper.h"

NSString *const kFilmProperty = @"film";

@interface FilmGenresCollectionView () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSArray *controllers;

@end

@implementation FilmGenresCollectionView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];

    if (self)
    {
        [self configCollectionView];
    }
    
    return self;
}

#pragma mark - Config methods.
- (void)configCollectionView
{
    self.dataSource = self;
    self.delegate = self;
    [self registerNib:[UINib nibWithNibName:NSStringFromClass([GenreFilmDetailCollectionViewCell class]) bundle:nil]forCellWithReuseIdentifier:NSStringFromClass([GenreFilmDetailCollectionViewCell class])];
    [self registerToObserveFilm];
}

#pragma mark - Update methods.
- (void)updateControllers
{
    NSMutableArray *controllers = [NSMutableArray array];
    for (__unused GenreDTO *genre in self.film.filmGenres)
    {
        [controllers addObject:[FilmDetailGenreCollectionViewCellController new]];
    }
    self.controllers = controllers;
}

#pragma mark - Observe methods.
- (void)registerToObserveFilm
{
    [self addObserver:self forKeyPath:kFilmProperty options:NSKeyValueObservingOptionInitial context:nil];
}

- (void)unregisteroObserveFilm
{
    [self removeObserver:self forKeyPath:kFilmProperty];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:kFilmProperty])
    {
        [self updateControllers];
    }
}

#pragma mark - DataSource methods.
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.film.filmGenres.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GenreFilmDetailCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([GenreFilmDetailCollectionViewCell class]) forIndexPath:indexPath];
    
    FilmDetailGenreCollectionViewCellController *controller = self.controllers[indexPath.item];
    
    controller.cell = cell;
    controller.genre = self.film.filmGenres[indexPath.item];
    
    return [controller configuredCell];
}

#pragma mark - FlowDelegate methods.
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [SizeHelper filmDetailGenreCollectionViewCellSizeForGenre:self.film.filmGenres[indexPath.row]];
}

#pragma mark - Dealloc.
- (void)dealloc
{
    [self unregisteroObserveFilm];
}

@end
