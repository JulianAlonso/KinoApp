//
//  SearchFilmTableViewCellController.m
//  KinoApp
//
//  Created by Julian Alonso on 20/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>
#import "SearchFilmTableViewCellController.h"
#import "FilmTableViewCell.h"
#import "FilmDTO.h"

@interface SearchFilmTableViewCellController () <FilmTableViewCellDelegate>

@end

@implementation SearchFilmTableViewCellController

- (UITableViewCell *)configuredCell
{
    self.cell.delegate = self;
    
    self.cell.filmTitleLabel.text = self.film.filmTitle;
    self.cell.filmYearLabel.text = self.film.filmYear;
    [self.cell.filmImageView sd_setImageWithURL:[NSURL URLWithString:self.film.filmPosterPath]];
    
    return self.cell;
}

- (void)filmTableViewCell:(FilmTableViewCell *)filmTableViewCell didTapWithSender:(UITapGestureRecognizer *)sender
{
    [self.delegate searchFilmTableViewCellController:self tappedCellWithFilm:self.film];
}

@end
