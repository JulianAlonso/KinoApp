//
//  FilmGenresCollectionView.h
//  KinoApp
//
//  Created by Julian Alonso on 27/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FilmDTO;

@interface FilmGenresCollectionView : UICollectionView

@property (nonatomic, strong) FilmDTO *film;

@end
