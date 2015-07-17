//
//  DelegatesAssembly.h
//  KinoApp
//
//  Created by Julian Alonso on 16/7/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "TyphoonAssembly.h"
#import "BillboardCollectionDelegateProtocol.h"
#import "FilmsCollectionDelegate.h"

@class InteractorsAssembly;
@class ViewControllersAssembly;

@interface DelegatesAssembly : TyphoonAssembly

@property (nonatomic, strong, readonly) InteractorsAssembly *interactorAssembly;
@property (nonatomic, strong, readonly) ViewControllersAssembly *viewControllersAssembly;

- (id<BillboardCollectionDelegateProtocol>)billboardDelegate;

- (id<FilmsCollectionDelegate>)billboardPlayingNowFilmsDelegate;

- (id<FilmsCollectionDelegate>)billboardUpcomingFilmsDelegate;

@end
