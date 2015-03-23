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
#import "ListsCollectionRouter.h"

@implementation FilmListCollectionViewCellController

- (FilmListCollectionViewCell *)cellConfigured
{
    self.cell.listNameLabel.text = self.list.listName;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureAction:)];
    
    [self.cell addGestureRecognizer:tapGesture];
    
    if (self.list.listFilms.count > 0 && self.list.listFilms.count < 4)
    {
        [self.cell.oneImageView sd_setImageWithURL:[NSURL URLWithString:[[self.list.listFilms firstObject] valueForKey:kPosterPathProperty]]];
    }
    else if (self.list.listFilms.count > 3)
    {
        int cont = 0;
        for (UIImageView *iv in self.cell.variousImagesViewCollection)
        {
            [iv sd_setImageWithURL:[NSURL URLWithString:[[self.list.listFilms objectAtIndex:cont] valueForKey:kPosterPathProperty]]];
            cont++;
        }
    }
    
    return self.cell;
}

- (void)tapGestureAction:(UITapGestureRecognizer *)sender
{
    [self.router tapAtCellWithListDTO:self.list];
}

@end