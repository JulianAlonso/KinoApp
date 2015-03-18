//
//  LoadFilmInteractor.m
//  KinoApp
//
//  Created by Julian Alonso on 18/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "LoadFilmInteractor.h"
#import "FilmDTO.h"

@implementation LoadFilmInteractor

- (void)loadFilmWithId:(NSString *)filmId completion:(void(^)(FilmDTO *film))completion update:(void(^)(FilmDTO *film))update
{
    [self.localProvider fetchFilmById:filmId completion:^(FilmDTO *film) {

        if (![film.filmOverview isEqualToString:@"(null)"])
        {
            update(film);
        }
        else
        {
            completion(film);

            [self.externalProvider fetchFilmById:filmId completion:^(FilmDTO *film) {
                [self.localProvider createOrUpdateFilm:film completion:^(FilmDTO *film) {
                    update(film);
                }];
            }];
        }
        
    }];
}

@end
