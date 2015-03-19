//
//  SelectListViewController.h
//  KinoApp
//
//  Created by Julian Alonso on 19/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SelectListRouter;
@class FetchAllListsInteractor;

@interface SelectListViewController : UIViewController

@property (nonatomic, strong) SelectListRouter *router;
@property (nonatomic, strong) id presentingRouter;

@property (nonatomic, strong) FetchAllListsInteractor *interactor;

@end
