//
//  DelegatesAssembly.m
//  KinoApp
//
//  Created by Julian Alonso on 16/7/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "DelegatesAssembly.h"
#import "BillboardCollectionDelegate.h"
#import "InteractorsAssembly.h"
#import "BillboardFilmsCollectionDelegate.h"
#import "ViewControllersAssembly.h"

@implementation DelegatesAssembly

- (id<BillboardCollectionDelegateProtocol>)billboardDelegate
{
    return [TyphoonDefinition withClass:[BillboardCollectionDelegate class] configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(cellDelegates) with:[self billboardDelegateCellDelegates]];
    }];
}

- (id<FilmsCollectionDelegate>)billboardPlayingNowFilmsDelegate
{
    return [TyphoonDefinition withClass:[BillboardFilmsCollectionDelegate class] configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(interactor) with:[_interactorAssembly loadPlayingNowFilmsInteractor]];
        [definition injectProperty:@selector(eventReceiver) with:[_viewControllersAssembly billboardViewController]];
    }];
}

- (id<FilmsCollectionDelegate>)billboardUpcomingFilmsDelegate
{
    return [TyphoonDefinition withClass:[BillboardFilmsCollectionDelegate class] configuration:^(TyphoonDefinition *definition)
    {
        [definition injectProperty:@selector(interactor) with:[_interactorAssembly loadUpcomingFilmsInteractor]];
        [definition injectProperty:@selector(eventReceiver) with:[_viewControllersAssembly billboardViewController]];
    }];
}

#pragma mark - Private methods.
- (NSArray *)billboardDelegateCellDelegates
{
    return @[
             [self billboardPlayingNowFilmsDelegate],
             [self billboardUpcomingFilmsDelegate]
             ];
}

@end
