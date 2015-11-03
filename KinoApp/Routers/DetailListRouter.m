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
#import "RouterAssembly.h"
#import "ViewControllersAssembly.h"

@implementation DetailListRouter

- (void)presentDetailListViewControllerFrom:(UIViewController *)fromViewController withList:(ListDTO *)list
{
    ListDetailViewController *listDetailViewController = [self.viewControllersAssembly listDetailViewController];
    listDetailViewController.router = self;
    self.listDetailViewController = listDetailViewController;
    
    self.listDetailViewController.list = list;
    
    [fromViewController.navigationController pushViewController:self.listDetailViewController animated:YES];
}

- (void)searchButtonPressed
{
    
    [[self.routerAssembly searchFilmRouter] presentSearchFrom:self.listDetailViewController.navigationController
                                                      andList:self.listDetailViewController.list];
}

- (void)tappedCellWithFilm:(FilmDTO *)film
{    
    [[self.routerAssembly detailFilmRouter] presentFilmDetailViewControllerFrom:self.listDetailViewController.navigationController
                                                                    withFilmDTO:film];
}

@end
