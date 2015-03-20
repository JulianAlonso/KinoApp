//
//  List+Model.m
//  KinoApp
//
//  Created by Julian Alonso on 20/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "List+Model.h"

@implementation List (Model)

- (NSString *)description
{
    return [NSString stringWithFormat:@"Name: %@, Films: { %@ }", self.listName, @"ho"];
}

@end
