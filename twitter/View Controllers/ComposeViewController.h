//
//  ComposeViewController.h
//  twitter
//
//  Created by antiriby on 7/2/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ComposeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *tweetButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *closeButton;
- (IBAction)postComposedTweet:(id)sender;
- (IBAction)closeComposedTweet:(id)sender;

@end

NS_ASSUME_NONNULL_END
