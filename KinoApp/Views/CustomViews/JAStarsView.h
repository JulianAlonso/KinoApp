//
//  JAStarsView.h
//  KinoApp
//
//  Created by Julian Alonso on 2/11/15.
//  Copyright © 2015 Julian. All rights reserved.
//

#import "JAXibView.h"

@interface JAStarsView : JAXibView

/**
 * The note number must be from 0 to 10
 */
@property (nonatomic, strong) NSNumber *note;

@end
