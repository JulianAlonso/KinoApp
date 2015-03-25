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
#import "InteractorsFactory.h"
#import "AddFilmToListInteractor.h"
#import "RemoveFilmFromListInteractor.h"

@interface FilmDetailListTableViewCellController ()

@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;

@end

@implementation FilmDetailListTableViewCellController

- (UITableViewCell *)configuredCell
{
    self.cell.delegate = self;
    self.cell.listNameLabel.text = self.list.listName;
    [self configActivityIndicator];
    
    if ([self.list.listFilms containsObject:self.film])
    {
        self.cell.listCheckedImageView.image = [UIImage imageNamed:@"Checkmark"];
    }
    
    return self.cell;
}

#pragma mark - config methods.
- (void)configActivityIndicator
{
    self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    self.activityIndicator.frame = self.cell.listCheckedImageView.frame;
}

#pragma mark - FilmDetailListTableViewCellDelegate methods.
- (void)filmDetailListTableViewCell:(FilmDetailListTableViewCell *)filmDetailListTableViewCell didTappedWithSender:(UITapGestureRecognizer *)sender
{
    if ([self.list.listFilms containsObject:self.film])
    {
        __weak typeof(self) weakSelf = self;
        [self.removeFilmInteractor removeFilm:self.film fromList:self.list withCompletion:^(ListDTO *list, NSError *error) {
            __strong typeof(weakSelf) strongSelf = weakSelf;
            if (!error)
            {
                strongSelf.list = list;
                dispatch_async(dispatch_get_main_queue(), ^{
                    strongSelf.cell.listCheckedImageView.image = nil;
                });
            }
        }];
    }
    else
    {
        [self.cell.listCheckedImageView addSubview:self.activityIndicator];
        [self.activityIndicator startAnimating];
        __weak typeof(self) weakSelf = self;
        [self.addFilmInteractor addFilm:self.film toList:self.list completion:^(ListDTO *list, NSError *error) {
            __strong typeof(weakSelf) strongSelf = weakSelf;
            
            strongSelf.list = list;
            dispatch_async(dispatch_get_main_queue(), ^{
                if (error)
                {
                    [strongSelf.activityIndicator removeFromSuperview];
                }
                else
                {
                    [strongSelf.activityIndicator stopAnimating];
                    [strongSelf.activityIndicator removeFromSuperview];
                    strongSelf.cell.listCheckedImageView.image = [UIImage imageNamed:@"Checkmark"];
                }
            });
        }];
    }
}

#pragma mark - Lazy getters.
- (AddFilmToListInteractor *)addFilmInteractor
{
    if (!_addFilmInteractor)
    {
        _addFilmInteractor = [InteractorsFactory addFilmToListInteractor];
    }
    return _addFilmInteractor;
}

- (RemoveFilmFromListInteractor *)removeFilmInteractor
{
    if (!_removeFilmInteractor)
    {
        _removeFilmInteractor = [InteractorsFactory removeFilmFromListInteractor];
    }
    return _removeFilmInteractor;
}

@end
