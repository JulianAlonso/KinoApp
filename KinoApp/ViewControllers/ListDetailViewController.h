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
@class UpdateListInteractor;
@class ControllersAssembly;

@interface ListDetailViewController : UIViewController

@property (nonatomic, strong) ControllersAssembly *controllersAssembly;
@property (nonatomic, strong) DetailListRouter *router;
@property (nonatomic, strong) UpdateListInteractor *updateListInteractor;
@property (nonatomic, strong) ListDTO *list;

@end
