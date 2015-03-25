//
//  ListCollectionViewCell.h
//  KinoApp
//
//  Created by Julian Alonso on 18/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FilmListCollectionViewCellController;

@interface FilmListCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIView *listPostersView;
@property (weak, nonatomic) IBOutlet UILabel *listNameLabel;

@property (weak, nonatomic) IBOutlet UIImageView *oneImageView;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *variousImagesViewCollection;

@property (nonatomic, strong) FilmListCollectionViewCellController *controller;

- (void)addBackgroundLayer;
- (void)removeBackgroundLayer;

@end
