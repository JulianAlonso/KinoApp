//
//  DetailListRouter.m
//  KinoApp
//
//  Created by Julian Alonso on 20/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "DetailListRouter.h"
#import "ListDTO.h"
#import "ListDetailViewController.h"
#import "SearchFilmRouter.h"
#import "FilmDTO.h"
#import "DetailFilmRouter.h"
#import "LocalCoreDataListsProvider.h"
#import "UpdateListInteractor.h"

@interface DetailListRouter ()

@property (nonatomic, weak) ListDetailViewController *listDetailViewController;

@end

@implementation DetailListRouter

- (void)presentDetailListViewControllerFrom:(UIViewController *)fromViewController withList:(ListDTO *)list
{
    ListDetailViewController *listDetailViewController = [ListDetailViewController new];
    
    UpdateListInteractor *updateListInteractor = [UpdateListInteractor new];
    updateListInteractor.localListProvider = [LocalCoreDataListsProvider new];
    
    
    listDetailViewController.updateListInteractor = updateListInteractor;
    listDetailViewController.list = list;
    listDetailViewController.router = self;
    self.listDetailViewController = listDetailViewController;
    
    [fromViewController.navigationController pushViewController:listDetailViewController animated:YES];
}

- (void)searchButtonPressed
{
    SearchFilmRouter *searchRouter = [SearchFilmRouter new];
    
    [searchRouter presentSearchFrom:self.listDetailViewController.navigationController andList:self.listDetailViewController.list];
}

- (void)tappedCellWithFilm:(FilmDTO *)film
{    
    [[DetailFilmRouter new] presentFilmDetailViewControllerFrom:self.listDetailViewController.navigationController withFilmDTO:film];
}

@end
