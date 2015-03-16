//
//  BillboardCollectionDelegate.h
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoadBillboardInteractor.h"
#import "BillboardCollectionDelegateProtocol.h"

@interface BillboardCollectionDelegate : NSObject <BillboardCollectionDelegateProtocol>

@property (nonatomic, weak) UICollectionView *billBoardCollection;

@end
