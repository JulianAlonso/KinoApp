//
//  LocalCoreDataListsProvider.h
//  KinoApp
//
//  Created by Julian Alonso on 18/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "LocalListsProvider.h"


@interface LocalCoreDataListsProvider : NSObject <LocalListsProvider>

@property (nonatomic, strong) NSManagedObjectContext *privateContext;

@end
