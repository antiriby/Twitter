//
//  TweetCell.h
//  twitter
//
//  Created by antiriby on 7/1/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

NS_ASSUME_NONNULL_BEGIN

//Step 2.
//Define a custom table view cell and set it’s reuse identifier
@interface TweetCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *userScreenName;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *tweetText;
@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;
@property (weak, nonatomic) IBOutlet UIButton *retweetButton;
@property (strong, nonatomic) Tweet *tweet;
- (IBAction)didTapFavorite:(id)sender;
- (IBAction)didTapRetweet:(id)sender;

@end

NS_ASSUME_NONNULL_END
