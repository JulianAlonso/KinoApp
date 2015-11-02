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
@class ControllersAssembly;

@interface DelegatesAssembly : TyphoonAssembly

@property (nonatomic, strong, readonly) InteractorsAssembly *interactorAssembly;
@property (nonatomic, strong, readonly) ViewControllersAssembly *viewControllersAssembly;
@property (nonatomic, strong, readonly) ControllersAssembly *controllersAssembly;

- (id<BillboardCollectionDelegateProtocol>)billboardDelegate;

- (id<FilmsCollectionDelegate>)billboardPlayingNowFilmsDelegate;

- (id<FilmsCollectionDelegate>)billboardUpcomingFilmsDelegate;

@end
