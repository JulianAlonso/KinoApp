//
//  ControllersAssembly.m
//  KinoApp
//
//  Created by Julian Alonso on 27/10/15.
//  Copyright © 2015 Julian. All rights reserved.
//

#import "ControllersAssembly.h"
#import "FilmListCollectionViewCellController.h"
#import "FilmCollectionViewCellController.h"

@implementation ControllersAssembly

- (FilmListCollectionViewCellController *)filmListCollectionViewCellContorller
{
    return [TyphoonDefinition withClass:[FilmListCollectionViewCellController class]];
}

- (FilmCollectionViewCellController *)filmCollectionViewCellController
{
    return [TyphoonDefinition withClass:[FilmCollectionViewCellController class]];
}

@end
