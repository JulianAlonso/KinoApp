//
//  SelectListRouter.m
//  KinoApp
//
//  Created by Julian Alonso on 19/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "SelectListRouter.h"
#import "SelectListModalTransitionAnimator.h"
#import "SelectListViewController.h"
#import "FetchAllListsInteractor.h"
#import "LocalCoreDataListsProvider.h"
#import "DetailFilmRouter.h"

@interface SelectListRouter () <UIViewControllerTransitioningDelegate>

@end

@implementation SelectListRouter

- (void)presentModallyFromViewController:(UINavigationController *)fromNavigationController andRouter:(id)router
{
    SelectListViewController *selectListViewController = [SelectListViewController new];
    selectListViewController.router = self;
    selectListViewController.interactor = [FetchAllListsInteractor new];
    selectListViewController.interactor.localListProvider = [LocalCoreDataListsProvider new];
    
    selectListViewController.presentingRouter = router;
    
//    selectListViewController.transitioningDelegate = self;

    [fromNavigationController presentViewController:selectListViewController animated:YES completion:nil];
}

#pragma mark - Transition delegate methods.
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    SelectListModalTransitionAnimator *animator = [SelectListModalTransitionAnimator new];
    animator.presenting = YES;
    
    return animator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    SelectListModalTransitionAnimator *animator = [SelectListModalTransitionAnimator new];
    animator.presenting = NO;
    
    return animator;
}

@end
