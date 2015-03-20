//
//  FilmTableViewCellController.m
//  KinoApp
//
//  Created by Julian Alonso on 20/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>
#import "FilmTableViewCellController.h"
#import "FilmTableViewCell.h"
#import "FilmDTO.h"

@interface FilmTableViewCellController () <FilmTableViewCellDelegate>

@end

@implementation FilmTableViewCellController

- (UITableViewCell *)configuredCell
{
    self.cell.delegate = self;
    
    self.cell.filmTitleLabel.text = self.film.filmTitle;
    [self.cell.filmImageView sd_setImageWithURL:[NSURL URLWithString:self.film.filmBackdropPath]];
    
    return self.cell;
}

#pragma mark - FilmTableViewCellDelegate methods.
- (void)filmTableViewCell:(FilmTableViewCell *)filmTableViewCell didTapWithSender:(UITapGestureRecognizer *)sender
{
    [self.delegate filmTableViewCellController:self tappedCellWithFilm:self.film];
}

@end
