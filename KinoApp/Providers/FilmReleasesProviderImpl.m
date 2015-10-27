//
//  FilmReleasesProviderImpl.m
//  KinoApp
//
//  Created by Julian Alonso on 27/10/15.
//  Copyright © 2015 Julian. All rights reserved.
//

#import "FilmReleasesProviderImpl.h"
#import "APIVars.h"

@implementation FilmReleasesProviderImpl

- (NSArray<FilmReleaseDTO *> *)filmReleaseDTOsForFilmWithId:(NSString *)filmId
{
    NSString *endpoint = [NSString stringWithFormat:FILM_RELEASE_DATE_ENDPOINT, filmId];
    
    [self.requestManager GETendpoint:endpoint params:nil andCompletionBlock:^(NSData *data)
    {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        
        return [
    }];
}

@end
