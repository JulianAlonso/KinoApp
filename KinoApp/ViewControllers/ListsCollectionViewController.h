//
//  ListsCollectionViewController.h
//  KinoApp
//
//  Created by Julian Alonso on 18/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FetchAllListsInteractor;
@class ListsCollectionRouter;
@class ListsCollectionDelegate;

@interface ListsCollectionViewController : UIViewController

@property (nonatomic, strong) FetchAllListsInteractor *fetchAllListsInteractor;
@property (nonatomic, strong) ListsCollectionRouter *router;
@property (nonatomic, strong) ListsCollectionDelegate *delegate;

@end
