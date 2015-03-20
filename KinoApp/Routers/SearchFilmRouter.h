//
//  SearchListRouter.h
//  KinoApp
//
//  Created by Julian Alonso on 20/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ListDTO;

@interface SearchFilmRouter : NSObject

- (void)presentSearchFrom:(UINavigationController *)fromNavigationController andList:(ListDTO *)list;

@end
