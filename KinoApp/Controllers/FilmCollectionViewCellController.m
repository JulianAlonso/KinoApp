//
//  FilmTableViewCellController.m
//  KinoApp
//
//  Created by Julian Alonso on 20/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>
#import "FilmCollectionViewCellController.h"
#import "FilmDTO.h"
#import "BillboardFilmCollectionViewCell.h"

@interface FilmCollectionViewCellController () <BillboardFilmCollectionViewCellDelegate>

@end

@implementation FilmCollectionViewCellController

- (BillboardFilmCollectionViewCell *)configuredCell
{
    self.cell.delegate = self;
    
    self.cell.filmTitleLabel.text = self.film.filmTitle;
    [self.cell.filmImageView sd_setImageWithURL:[NSURL URLWithString:self.film.filmPosterPath]];
    
    return self.cell;
}

#pragma mark - FilmTableViewCellDelegate methods.
- (void)billboardFilmCollectionViewCell:(BillboardFilmCollectionViewCell *)filmTableViewCell didTapWithSender:(UITapGestureRecognizer *)sender
{
    [self.delegate filmCollectionViewCellController:self tappedCellWithFilm:self.film];
}

@end
