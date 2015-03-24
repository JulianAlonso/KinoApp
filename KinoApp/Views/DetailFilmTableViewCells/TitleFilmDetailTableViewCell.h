//
//  TitleFilmDetailTableViewCell.h
//  KinoApp
//
//  Created by Julian Alonso on 24/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilmDetailViewCell.h"

@class FilmDTO;

@interface TitleFilmDetailTableViewCell : UITableViewCell <FilmDetailViewCell>

@property (weak, nonatomic) IBOutlet UILabel *filmTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *filmPrincipalDataLabel;

@property (nonatomic, strong) FilmDTO *film;

@end
