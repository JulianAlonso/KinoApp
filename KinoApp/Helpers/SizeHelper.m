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
#import "GenresFilmDetailTableViewCellController.h"
#import "GenresFilmDetailTableViewCell.h"
#import "FilmDetailTableViewCellFactory.h"
#import "TitleFilmDetailTableViewCell.h"
#import "PrincipalDataFilmDetailTableViewCell.h"
#import "OverviewFilmDetailTableViewCell.h"

@implementation SizeHelper

+ (CGSize)filmDetailGenreCollectionViewCellSizeForGenre:(GenreDTO *)genre
{
    FilmDetailGenreCollectionViewCellController *controller = [FilmDetailGenreCollectionViewCellController new];
    controller.cell = [SizeHelper genreFilmDetailCollectionViewCell];
    controller.genre = genre;
    
    UICollectionViewCell *configured = [controller configuredCell];
    
    return [configured systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
}

+ (CGFloat)titleFilmDetailTableViewCellHeightForFilm:(FilmDTO *)film andWidth:(CGFloat)width
{
    TitleFilmDetailTableViewCell *titleCell = [SizeHelper titleFilmDetailTableViewCell];
    titleCell.filmTitleLabel.preferredMaxLayoutWidth = width;
    id<DetailFilmTableViewCellController> titleController = [FilmDetailTableViewCellFactory controllerForCellClass:[titleCell class]];
    titleController.cell = titleCell;
    titleController.film = film;
    
    [titleCell setNeedsLayout];
    [titleCell layoutIfNeeded];
    
    UITableViewCell *configured = [titleController configuredCell];
    
    return [configured systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + 1.0f;
}

+ (CGFloat)principalFilmDetailTableViewCellHeightForFilm:(FilmDTO *)film andWidth:(CGFloat)width
{
    PrincipalDataFilmDetailTableViewCell *cell = [SizeHelper principalDataFilmDetailTableViewCell];
    cell.filmPrincipalDataLabel.preferredMaxLayoutWidth = width;
    id<DetailFilmTableViewCellController> controller = [FilmDetailTableViewCellFactory controllerForCellClass:[cell class]];
    controller.cell = cell;
    controller.film = film;
    
    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    
    UITableViewCell *configured = [controller configuredCell];
    
    return [configured systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + 1.0f;
}

+ (CGFloat)overviewFilmDetailTableViewCellHeightForFilm:(FilmDTO *)film andWidth:(CGFloat)width
{
    OverviewFilmDetailTableViewCell *cell = [SizeHelper overviewFilmDetailTableViewCell];
    cell.filmOverviewLabel.preferredMaxLayoutWidth = width;
    id<DetailFilmTableViewCellController> controller = [FilmDetailTableViewCellFactory controllerForCellClass:[cell class]];
    controller.cell = cell;
    controller.film = film;
    
    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    
    UITableViewCell *configured = [controller configuredCell];
    
    return [configured systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + 1.0f;
}

#pragma mark - False getters methods.
+ (GenreFilmDetailCollectionViewCell *)genreFilmDetailCollectionViewCell
{
    UINib *cellNib = [UINib nibWithNibName:NSStringFromClass([GenreFilmDetailCollectionViewCell class]) bundle:nil];
    return [[cellNib instantiateWithOwner:nil options:nil] firstObject];
}

+ (TitleFilmDetailTableViewCell *)titleFilmDetailTableViewCell
{
    UINib *cellNib = [UINib nibWithNibName:NSStringFromClass([TitleFilmDetailTableViewCell class]) bundle:nil];
    return [[cellNib instantiateWithOwner:nil options:nil] firstObject];
}

+ (PrincipalDataFilmDetailTableViewCell *)principalDataFilmDetailTableViewCell
{
    UINib *cellNib = [UINib nibWithNibName:NSStringFromClass([PrincipalDataFilmDetailTableViewCell class]) bundle:nil];
    return [[cellNib instantiateWithOwner:nil options:nil] firstObject];
}

+ (OverviewFilmDetailTableViewCell *)overviewFilmDetailTableViewCell
{
    UINib *cellNib = [UINib nibWithNibName:NSStringFromClass([OverviewFilmDetailTableViewCell class]) bundle:nil];
    return [[cellNib instantiateWithOwner:nil options:nil] firstObject];
}

@end









