//
//  FilmDetailListTableViewCell.h
//  KinoApp
//
//  Created by Julian Alonso on 25/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FilmDetailListTableViewCell;

@protocol FilmDetailListTableViewCellDelegate <NSObject>

- (void)filmDetailListTableViewCell:(FilmDetailListTableViewCell *)filmDetailListTableViewCell didTappedWithSender:(UITapGestureRecognizer *)sender;

@end

@interface FilmDetailListTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *listNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *listCheckedImageView;

@property (nonatomic, strong) id<FilmDetailListTableViewCellDelegate> delegate;

@end
