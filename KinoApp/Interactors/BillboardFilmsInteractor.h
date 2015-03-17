//
//  BillboardFilmsInteractor.h
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BillboardFilmsInteractor <NSObject>

- (void)fetchFilmsWithComplectionBlock:(void(^)(NSArray *films))completionBlock;

@end
