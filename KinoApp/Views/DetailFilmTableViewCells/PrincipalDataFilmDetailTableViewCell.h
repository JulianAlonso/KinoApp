//
//  PrincipalDataFilmDetailTableViewCell.h
//  KinoApp
//
//  Created by Julian Alonso on 25/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilmDetailViewCell.h"

@interface PrincipalDataFilmDetailTableViewCell : UITableViewCell <FilmDetailViewCell>

@property (weak, nonatomic) IBOutlet UILabel *filmPrincipalDataLabel;

@end
