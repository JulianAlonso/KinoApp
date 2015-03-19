//
//  ControllersFactory.m
//  KinoApp
//
//  Created by Julian Alonso on 19/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "ControllersFactory.h"
#import "FilmListCollectionViewCell.h"
#import "FilmListCollectionViewCellController.h"

@implementation ControllersFactory

+ (id)controllerForCellClass:(Class)cellClass
{
    return [[self controllerClassForCellClass:cellClass] new];
}

+ (Class)controllerClassForCellClass:(Class)cellClass
{
    static NSDictionary *classes = nil;
    
    if (!classes)
    {
        classes = @{
                    NSStringFromClass([FilmListCollectionViewCell class]) : [FilmListCollectionViewCellController class],
                    };
    }
    
    return classes[NSStringFromClass(cellClass)];
}

@end
