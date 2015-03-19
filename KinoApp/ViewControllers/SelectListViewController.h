//
//  SelectListViewController.h
//  KinoApp
//
//  Created by Julian Alonso on 19/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FetchAllListsInteractor.h"

@interface SelectListViewController : UIViewController

@property (nonatomic, strong) id router;

@property (nonatomic, strong) FetchAllListsInteractor *interactor;

@end
