//
//  APIManager.h
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "Tweet.h"
#import "BDBOAuth1SessionManager.h"
#import "BDBOAuth1SessionManager+SFAuthenticationSession.h"

@interface APIManager : BDBOAuth1SessionManager

+ (instancetype)shared;

//API function request for timeline
- (void)getHomeTimelineWithCompletion:(void(^)(NSArray *tweets, NSError *error))completion;

- (void)postStatusWithText:(NSString *)text completion:(void (^)(Tweet *, NSError *))completion;

- (void)favorite:(Tweet *)tweet completion:(void (^)(Tweet *, NSError *))completion;

//Add more method calls for other functions like favoriting, retweeting, sharing, etc.

@end
