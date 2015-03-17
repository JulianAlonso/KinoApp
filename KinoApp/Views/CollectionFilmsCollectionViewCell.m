//
//  CollectionFilmsCollectionViewCell.m
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "CollectionFilmsCollectionViewCell.h"
#import "BillboardCollectionViewCell.h"

@interface CollectionFilmsCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UICollectionView *filmsCollectionView;

@end


@implementation CollectionFilmsCollectionViewCell

- (void)awakeFromNib
{
    [self configRefreshControl];
    [self configBillboardCollection];
}

#pragma mark - Config methods.
- (void)configBillboardCollection
{

    self.filmsCollectionView.alwaysBounceVertical = YES;
    
    [self.filmsCollectionView addSubview:self.refreshControl];
    
    [self.filmsCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([BillboardCollectionViewCell class]) bundle:nil]
               forCellWithReuseIdentifier:NSStringFromClass([BillboardCollectionViewCell class])];
}

- (void)configRefreshControl
{
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(refreshActivated:) forControlEvents:UIControlEventValueChanged];
}

#pragma mark - Action methods.
- (void)refreshActivated:(UIRefreshControl *)sender
{
    [self.delegate refresh:sender];
}

#pragma mark - Setters.
- (void)setDelegate:(id<FilmsCollectionDelegate>)delegate
{
    _delegate = delegate;
    self.filmsCollectionView.delegate = self.delegate;
    self.filmsCollectionView.dataSource = self.delegate;
}

@end
