//
//  SizeHelper.m
//  KinoApp
//
//  Created by Julian Alonso on 26/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "SizeHelper.h"
#import "FilmDetailGenreCollectionViewCellController.h"
#import "GenreFilmDetailCollectionViewCell.h"
#import "GenreDTO.h"
#import "FilmDTO.h"

@implementation SizeHelper

+ (CGSize)filmDetailGenreCollectionViewCellSizeForGenre:(GenreDTO *)genre
{
    FilmDetailGenreCollectionViewCellController *controller = [FilmDetailGenreCollectionViewCellController new];
    controller.cell = [SizeHelper genreFilmDetailCollectionViewCell];
    controller.genre = genre;
    
    UICollectionViewCell *configured = [controller configuredCell];
    
    return [configured systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
}

#pragma mark - False getters methods.
+ (GenreFilmDetailCollectionViewCell *)genreFilmDetailCollectionViewCell
{
    UINib *cellNib = [UINib nibWithNibName:NSStringFromClass([GenreFilmDetailCollectionViewCell class]) bundle:nil];
    return [[cellNib instantiateWithOwner:nil options:nil] firstObject];
}

@end









