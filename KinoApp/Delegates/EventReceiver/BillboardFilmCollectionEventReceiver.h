//
//  BillboardFilmCollectionEventReceiver.h
//  KinoApp
//
//  Created by Julian Alonso on 18/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FilmDTO;

@protocol BillboardFilmCollectionEventReceiver <NSObject>

- (void)billboardFilmCollectionViewCellSelectedWithFilmDTO:(FilmDTO *)filmDTO;

@end
