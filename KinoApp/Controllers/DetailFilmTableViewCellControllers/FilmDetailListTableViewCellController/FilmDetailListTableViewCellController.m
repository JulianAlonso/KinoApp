//
//  FilmDetailListTableViewCellController.m
//  KinoApp
//
//  Created by Julian Alonso on 25/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "FilmDetailListTableViewCellController.h"
#import "FilmDetailListTableViewCell.h"
#import "ListDTO.h"

@implementation FilmDetailListTableViewCellController

- (UITableViewCell *)configuredCell
{
    self.cell.delegate = self;
    self.cell.listNameLabel.text = self.list.listName;
    
    return self.cell;
}

#pragma mark - FilmDetailListTableViewCellDelegate methods.
- (void)filmDetailListTableViewCell:(FilmDetailListTableViewCell *)filmDetailListTableViewCell didTappedWithSender:(UITapGestureRecognizer *)sender
{
    NSLog(@"tapped cell: %@", self.cell);
}

@end
