//
//  SelectListRouter.h
//  KinoApp
//
//  Created by Julian Alonso on 19/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ListDTO;
@class SelectListViewController;

@interface SelectListRouter : NSObject

- (void)presentModallyFromViewController:(UINavigationController *)fromNavigationController andRouter:(id)router;

@end
