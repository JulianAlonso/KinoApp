//
//  CheckNextReleasesInteractor.h
//  KinoApp
//
//  Created by Julian Alonso on 11/5/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckNextReleasesInteractor : NSObject

- (void)checkNextReleasesWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler;

@end
