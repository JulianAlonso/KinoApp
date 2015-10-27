//
//  FilmReleaseDateDTO.h
//  KinoApp
//
//  Created by Julian Alonso on 27/10/15.
//  Copyright © 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FilmReleaseDTO : NSObject

@property (nonatomic, copy) NSString *releaseCertification;
@property (nonatomic, copy) NSString *releaseCountryISO;
@property (nonatomic, strong) NSDate *releaseDate;

@end
