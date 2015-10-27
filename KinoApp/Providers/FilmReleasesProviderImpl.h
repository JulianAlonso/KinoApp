//
//  FilmReleasesProviderImpl.h
//  KinoApp
//
//  Created by Julian Alonso on 27/10/15.
//  Copyright © 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FilmReleasesProvider.h"
#import "RequestManager.h"

@interface FilmReleasesProviderImpl : NSObject <FilmReleasesProvider>

@property (nonatomic, strong) id<RequestManager> requestManager;

@end
