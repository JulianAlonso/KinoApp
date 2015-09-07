//
//  JANavigationController.m
//  KinoApp
//
//  Created by Julian Alonso on 7/9/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "JANavigationController.h"

@interface JANavigationController () <UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@end

@implementation JANavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    __weak typeof(self) weakSelf = self;
    self.interactivePopGestureRecognizer.delegate = weakSelf;
}

@end
