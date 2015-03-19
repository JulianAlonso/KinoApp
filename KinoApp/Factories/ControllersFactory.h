//
//  ControllersFactory.h
//  KinoApp
//
//  Created by Julian Alonso on 19/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ControllersFactory : NSObject

+ (id)controllerForCellClass:(Class)cellClass;

@end
