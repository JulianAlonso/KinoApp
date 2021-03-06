//
//  BillboardRouter.m
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "BillboardRouter.h"
#import "BillboardViewController.h"
#import "BillboardCollectionDelegate.h"
#import "ExternalTMDBProvider.h"
#import "LoadPlayingNowFilmsInteractor.h"
#import "FilmsCollectionDelegate.h"
#import "LoadUpcomingFilmsInteractor.h"
#import "LocalCoreDataFilmsProvider.h"
#import "BillboardFilmsCollectionDelegate.h"
#import "FilmDTO.h"
#import "DetailFilmRouter.h"
#import "ViewControllersAssembly.h"
#import "RouterAssembly.h"
#import "JANavigationController.h"

@implementation BillboardRouter

- (void)loadViewAt:(UITabBarController *)tabBarController
{
    BillboardViewController *billboardViewController = [self.viewControllersAssembly billboardViewController];
    billboardViewController.router = self;
    self.billboardViewController = billboardViewController;
    
    UINavigationController *nc = [[JANavigationController alloc] initWithRootViewController:billboardViewController];

    nc.tabBarItem.title = NSLocalizedString(@"billboard", nil);
    nc.tabBarItem.image =  [UIImage imageNamed:@"Films"];
    
    [tabBarController addChildViewController:nc];
}

- (void)selectedCellWithFilmDTO:(FilmDTO *)filmDTO fromViewController:(UIViewController *)fromViewController
{
    [[self.routerAssembly detailFilmRouter] presentFilmDetailViewControllerFrom:fromViewController.navigationController withFilmDTO:filmDTO];
}

@end
