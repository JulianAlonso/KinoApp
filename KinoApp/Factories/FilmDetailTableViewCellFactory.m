//
//  FilmDetailTableViewCellFactory.m
//  KinoApp
//
//  Created by Julian Alonso on 24/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "FilmDetailTableViewCellFactory.h"
#import "TitleFilmDetailTableViewCell.h"
#import "OverviewFilmDetailTableViewCell.h"
#import "GenresFilmDetailTableViewCell.h"
#import "ListFilmDetailTableViewCell.h"
#import "TitleFilmDetailTableViewCellController.h"
#import "OverviewFilmDetailTableViewCellController.h"
#import "GenresFilmDetailTableViewCellController.h"
#import "ListsFilmDetailTableViewCellController.h"


@implementation FilmDetailTableViewCellFactory

+ (Class)cellClassForIndexpath:(NSIndexPath *)indexpath
{
    return [[FilmDetailTableViewCellFactory cellClasses] objectAtIndex:indexpath.row];
}

+ (id<DetailFilmTableViewCellController>)controllerForCellClass:(Class)clazz
{
    return [[[[FilmDetailTableViewCellFactory controllerClasses] valueForKey:NSStringFromClass(clazz)] alloc] init];
}


#pragma mark - Static Getters.
+ (NSDictionary *)controllerClasses
{
    static NSDictionary *controllerClasses;
    if (!controllerClasses)
    {
        controllerClasses = @{
                              NSStringFromClass([TitleFilmDetailTableViewCell class]) : [TitleFilmDetailTableViewCellController class],
                              NSStringFromClass([OverviewFilmDetailTableViewCell class]) : [OverviewFilmDetailTableViewCellController class],
                              NSStringFromClass([GenresFilmDetailTableViewCell class]) : [GenresFilmDetailTableViewCellController class],
                              NSStringFromClass([ListFilmDetailTableViewCell class]) : [ListsFilmDetailTableViewCellController class],
                              };
    }
    return controllerClasses;
}

+ (NSArray *)cellClasses
{
    static NSArray *cellClasses;
    if (!cellClasses)
    {
        cellClasses = @[[TitleFilmDetailTableViewCell class], [OverviewFilmDetailTableViewCell class], [GenresFilmDetailTableViewCell class], [ListFilmDetailTableViewCell class]];
    }
    
    return cellClasses;
}

@end
