//
//  BillboardCollectionViewCell.h
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BillboardFilmCollectionViewCell;

@protocol BillboardFilmCollectionViewCellDelegate <NSObject>

- (void)billboardFilmCollectionViewCell:(BillboardFilmCollectionViewCell *)filmTableViewCell didTapWithSender:(UITapGestureRecognizer *)sender;

@end

@interface BillboardFilmCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *filmImageView;
@property (weak, nonatomic) IBOutlet UILabel *filmTitleLabel;

@property (nonatomic, strong) id<BillboardFilmCollectionViewCellDelegate> delegate;

@end
