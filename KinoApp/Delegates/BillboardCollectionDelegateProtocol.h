//
//  BillboardCollectionDelegateProtocol.h
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BillboardCollectionDelegateProtocol <UICollectionViewDelegate, UICollectionViewDataSource>

- (void)refresh:(UIRefreshControl *)sender;

@end
