//
//  User.h
//  twitter
//
//  Created by antiriby on 7/1/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

//  User.h
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject

// TODO: Add properties
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *screenName;
// TODO: Create initializer
-(instancetype)initWithDictionary: (NSDictionary *)dictionary; //sets all the properties based on the dictionary

@end
NS_ASSUME_NONNULL_END
