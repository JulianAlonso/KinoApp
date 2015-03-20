//
//  ListDetailViewController.h
//  KinoApp
//
//  Created by Julian Alonso on 20/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ListDTO;
@class DetailListRouter;

@interface ListDetailViewController : UIViewController

@property (nonatomic, strong) DetailListRouter *router;
@property (nonatomic, strong) ListDTO *list;

@end
