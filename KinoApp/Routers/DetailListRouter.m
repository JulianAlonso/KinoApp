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

@interface DetailListRouter ()

@property (nonatomic, weak) ListDetailViewController *listDetailViewController;

@end

@implementation DetailListRouter

- (void)presentDetailListViewControllerFrom:(UIViewController *)fromViewController withList:(ListDTO *)list
{
    ListDetailViewController *listDetailViewController = [ListDetailViewController new];
    
    listDetailViewController.list = list;
    listDetailViewController.router = self;
    self.listDetailViewController = listDetailViewController;
    
    [fromViewController.navigationController pushViewController:listDetailViewController animated:YES];
}

- (void)searchButtonPressed
{
    NSLog(@"search button pressed");
}

@end
