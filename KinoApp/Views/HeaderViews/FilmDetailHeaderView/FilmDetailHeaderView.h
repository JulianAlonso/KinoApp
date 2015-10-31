//
//  FilmDetailHeaderView.h
//  KinoApp
//
//  Created by Julian Alonso on 30/7/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JAXibView.h"

@protocol FilmDetailHeaderViewDelegate <NSObject>

- (void)didTapAtBackButton:(UIButton *)sender;

@end


IB_DESIGNABLE
@interface FilmDetailHeaderView : JAXibView

@property (nonatomic, copy) NSString *filmName;
@property (nonatomic, weak) id<FilmDetailHeaderViewDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end
