//
//  TimelineViewController.h
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimelineViewController : UIViewController
@property (strong, nonatomic) NSMutableArray *tweetsArray;
-(void) fetchTweets;
- (IBAction)didTapLogout:(id)sender;

@end
