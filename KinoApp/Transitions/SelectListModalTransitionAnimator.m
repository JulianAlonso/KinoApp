//
//  SelectListModalTransition.m
//  KinoApp
//
//  Created by Julian Alonso on 19/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "SelectListModalTransitionAnimator.h"

static CGFloat totalDuration = 0.8f;

@interface SelectListModalTransitionAnimator ()

@property (nonatomic, strong) UIVisualEffectView *blurView;

@end

@implementation SelectListModalTransitionAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return totalDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    if (self.isPresenting)
    {
        [self presentAnimationWithTransitionContext:transitionContext];
    }
    else
    {
        [self dismissAnimationWithTransitionContext:transitionContext];
    }
}

#pragma mark - Transitions methods.
- (void)presentAnimationWithTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //PREPARING THE OBJECTS
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *contextView = [transitionContext containerView];
    
    UIView *toVCView = toVC.view;
    UIView *fromVCView = fromVC.view;
    
    [contextView addSubview:toVCView];
    [contextView addSubview:fromVCView];
    
    //PREPARING THE TRANSITION
    toVC.view.frame = CGRectMake(0, CGRectGetHeight(fromVCView.frame), CGRectGetWidth(toVC.view.frame), CGRectGetHeight(toVC.view.frame));
    
    UIVisualEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    self.blurView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
//    self.blurView.alpha = 0.0f;
    
    [fromVCView addSubview:self.blurView];
    
    
    [UIView animateWithDuration:totalDuration
                     animations:^{
//                         self.blurView.alpha = 0.8f;
                         toVC.view.frame = CGRectMake(0, CGRectGetHeight(fromVCView.frame) - (CGRectGetHeight(fromVCView.frame) * 0.25), CGRectGetWidth(toVC.view.frame), CGRectGetHeight(fromVCView.frame));
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)dismissAnimationWithTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //PREPARING THE OBJECTS
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *contextView = [transitionContext containerView];
    
    UIView *toVCView = toVC.view;
    UIView *fromVCView = fromVC.view;
    
    [contextView addSubview:toVCView];
    [contextView addSubview:fromVCView];
    
    //PREPARING THE TRANSITION
//    toVC.view.frame = CGRectMake(0, CGRectGetHeight(fromVCView.frame), CGRectGetWidth(toVC.view.frame), CGRectGetHeight(toVC.view.frame));
    
//    UIVisualEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
//    self.blurView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
//    self.blurView.alpha = 0.0f;
    
    [fromVCView addSubview:self.blurView];
    
    
    [UIView animateWithDuration:totalDuration
                     animations:^{
//                         self.blurView.alpha = 0.0f;
                         fromVC.view.frame = CGRectMake(0, CGRectGetHeight(fromVCView.frame), CGRectGetWidth(toVC.view.frame), CGRectGetHeight(fromVCView.frame));
                     }
                     completion:^(BOOL finished) {
                         [self.blurView removeFromSuperview];
                         [transitionContext completeTransition:YES];
                     }];
}


@end
