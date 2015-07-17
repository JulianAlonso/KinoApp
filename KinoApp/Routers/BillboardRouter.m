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

@implementation BillboardRouter

- (void)loadViewAt:(UITabBarController *)tabBarController
{
    #warning Better create the VC with typhoon and inject.
    BillboardViewController *billboardViewController = [self.viewControllersAssembly billboardViewController];
    
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:billboardViewController];
    #warning Not localized!
    nc.tabBarItem.title = @"Billboard";
    nc.tabBarItem.image =  [UIImage imageNamed:@"Films"];
    
    [tabBarController addChildViewController:nc];
}

- (void)selectedCellWithFilmDTO:(FilmDTO *)filmDTO fromViewController:(UIViewController *)fromViewController
{
    [[self.routerAssembly detailFilmRouter] presentFilmDetailViewControllerFrom:fromViewController.navigationController withFilmDTO:filmDTO];
}

@end
