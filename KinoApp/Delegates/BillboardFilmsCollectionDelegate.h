//
//  PlayingNowCollectionDelegate.h
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FilmsCollectionDelegate.h"
#import "BillboardFilmCollectionEventReceiver.h"

@interface BillboardFilmsCollectionDelegate : NSObject <FilmsCollectionDelegate>

@property (nonatomic, weak) id<BillboardFilmCollectionEventReceiver> eventReceiver;

@end
