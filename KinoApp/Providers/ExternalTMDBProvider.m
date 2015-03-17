//
//  ExternalTMDBProvider.m
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "ExternalTMDBProvider.h"
#import "RequestManagerFactory.h"
#import "APIVars.h"
#import "FilmDTOParser.h"

@implementation ExternalTMDBProvider

- (void)fetchUpcomingFilms:(void (^)(NSArray *))completion
{
    [self.requestManager GETendpoint:UPCOMING_ENDPOINT params:nil andCompletionBlock:^(NSData *data) {
        NSError *error;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        completion([FilmDTOParser filmDTOsFromArray:dic[@"results"]]);
    }];
}

- (void)fetchPlayingNowFilms:(void (^)(NSArray *))completion
{
    NSLog(@"Fetching playing now films");
    completion(nil);
}

#pragma mark - Lazy getterss.
- (id<RequestManager>)requestManager
{
    if (!_requestManager)
    {
        _requestManager = [RequestManagerFactory requestManager];
    }
    return _requestManager;
}

@end
