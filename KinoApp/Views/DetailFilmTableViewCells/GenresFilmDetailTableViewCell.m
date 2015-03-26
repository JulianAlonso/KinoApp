//
//  GenresFilmDetailTableViewCell.m
//  KinoApp
//
//  Created by Julian Alonso on 24/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "GenresFilmDetailTableViewCell.h"
#import "GenreFilmDetailCollectionViewCell.h"
#import "FilmDTO.h"
#import "FilmDetailGenreCollectionViewCellController.h"
#import "SizeHelper.h"

NSString *const kGenresFilmDetailTableViewCellFilmProperty = @"film";

@interface GenresFilmDetailTableViewCell () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collectionViewHeight;
@property (weak, nonatomic) IBOutlet UICollectionView *genresCollectionView;

@property (nonatomic, strong) NSArray *controllers;

@property (nonatomic, strong) GenreFilmDetailCollectionViewCell *sizingCell;

@end

@implementation GenresFilmDetailTableViewCell

@synthesize controller = _controller;

- (void)awakeFromNib
{
    [self configStyles];
    
    [self loadCell];
    [self registerToObserveFilm];
    [self configGenresCollectionView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

#pragma mark - Config methods.
- (void)configStyles
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    self.collectionViewHeight.constant = 100.0f;
}

- (void)configGenresCollectionView
{
    self.genresCollectionView.delegate = self;
    self.genresCollectionView.dataSource = self;
    [self.genresCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([GenreFilmDetailCollectionViewCell class]) bundle:nil]
                forCellWithReuseIdentifier:NSStringFromClass([GenreFilmDetailCollectionViewCell class])];
}

- (void)loadControllers
{
    NSMutableArray *controllers = [NSMutableArray array];
    for (__unused GenreDTO *genre in self.film.filmGenres)
    {
        [controllers addObject:[FilmDetailGenreCollectionViewCellController new]];
    }
    self.controllers = controllers;
}

- (void)loadCell
{
    UINib *cellNib = [UINib nibWithNibName:NSStringFromClass([GenreFilmDetailCollectionViewCell class]) bundle:nil];
    
    self.sizingCell = [[cellNib instantiateWithOwner:nil options:nil] firstObject];
}

#pragma mark - Observe methods.
- (void)registerToObserveFilm
{
    [self addObserver:self forKeyPath:kGenresFilmDetailTableViewCellFilmProperty options:NSKeyValueObservingOptionInitial context:nil];
}

- (void)unregisterToObserveFilm
{
    [self removeObserver:self forKeyPath:kGenresFilmDetailTableViewCellFilmProperty];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:kGenresFilmDetailTableViewCellFilmProperty])
    {
        [self loadControllers];
    }
}

#pragma mark - CollectionViewDataSource methods.
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GenreFilmDetailCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([GenreFilmDetailCollectionViewCell class]) forIndexPath:indexPath];
    
    FilmDetailGenreCollectionViewCellController *controller = self.controllers[indexPath.row];
    controller.cell = cell;
    controller.genre = self.film.filmGenres[indexPath.row];
    
    return [controller configuredCell];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.film.filmGenres.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [SizeHelper filmDetailGenreCollectionViewCellSizeForGenre:self.film.filmGenres[indexPath.row]];
}

#pragma mark - Dealloc.
- (void)dealloc
{
    [self unregisterToObserveFilm];
}
@end
