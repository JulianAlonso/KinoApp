//
//  FilmTableViewCell.h
//  KinoApp
//
//  Created by Julian Alonso on 20/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FilmTableViewCell;

@protocol FilmTableViewCellDelegate <NSObject>

- (void)filmTableViewCell:(FilmTableViewCell *)filmTableViewCell didTapWithSender:(UITapGestureRecognizer *)sender;

@end

@interface FilmTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *filmImageView;
@property (weak, nonatomic) IBOutlet UILabel *filmTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *filmYearLabel;

@property (nonatomic, strong) id<FilmTableViewCellDelegate> delegate;

@end
