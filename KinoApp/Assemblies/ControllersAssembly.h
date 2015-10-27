//
//  ControllersAssembly.h
//  KinoApp
//
//  Created by Julian Alonso on 27/10/15.
//  Copyright © 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TyphoonAssembly.h"

@class FilmListCollectionViewCellController;
@class FilmCollectionViewCellController;

@interface ControllersAssembly : TyphoonAssembly

- (FilmListCollectionViewCellController *)filmListCollectionViewCellContorller;

- (FilmCollectionViewCellController *)filmCollectionViewCellController;

@end
