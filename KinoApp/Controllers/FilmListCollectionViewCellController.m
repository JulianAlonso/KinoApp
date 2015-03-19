//
//  ListCollectionViewCellController.m
//  KinoApp
//
//  Created by Julian Alonso on 18/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>
#import "FilmListCollectionViewCellController.h"
#import "FilmListCollectionViewCell.h"
#import "ListDTO.h"
#import "FilmDTO.h"

@implementation FilmListCollectionViewCellController

- (FilmListCollectionViewCell *)cellConfigured
{
    self.cell.listNameLabel.text = self.list.listName;
    
    if (self.list.listFilms > 0)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.cell.bounds];
        [imageView sd_setImageWithURL:[[self.list.listFilms anyObject] valueForKey:kPosterPathProperty]];
    }
    
    return self.cell;
}

@end
