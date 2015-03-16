//
//  BillboardViewController.h
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BillboardCollectionDelegateProtocol.h"

@class BillboardRouter;


@interface BillboardViewController : UIViewController

@property (nonatomic, strong) BillboardRouter *router;

@property (nonatomic, strong) id<BillboardCollectionDelegateProtocol> delegate;

@end
