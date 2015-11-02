//
//  ControllersAssembly.h
//  KinoApp
//
//  Created by Julian Alonso on 27/10/15.
//  Copyright © 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TyphoonAssembly.h"

@class InteractorsAssembly;

@class FilmListCollectionViewCellController;
@class FilmCollectionViewCellController;
@class FilmDetailListTableViewCellController;

@interface ControllersAssembly : TyphoonAssembly

@property (nonatomic, strong, readonly) InteractorsAssembly *interactorsAssembly;

- (FilmListCollectionViewCellController *)filmListCollectionViewCellContorller;

- (FilmCollectionViewCellController *)filmCollectionViewCellController;

- (FilmDetailListTableViewCellController *)filmDetailListTableViewCellController;

@end
