//
//  TweetCell.m
//  twitter
//
//  Created by antiriby on 7/1/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "APIManager.h"

@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)didTapFavorite:(id)sender {
    // TODO: Update the local tweet model
    if (self.tweet.favorited) {
        self.tweet.favorited = NO;
        self.tweet.favoriteCount -= 1;
        [self.favoriteButton setImage:[UIImage imageNamed:@"favor-icon"] forState:UIControlStateNormal];
        
    } else {
        self.tweet.favorited = YES;
        self.tweet.favoriteCount += 1;
        [self.favoriteButton setImage:[UIImage imageNamed:@"favor-icon-red"] forState:UIControlStateNormal];
    }
    // TODO: Update cell UI
    [self.favoriteButton setTitle:[NSString stringWithFormat:@"%i", self.tweet.favoriteCount]forState:UIControlStateNormal];
    
    // TODO: Send a POST request to the POST favorites/create endpoint
    [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
        if(error){
            NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
        }
        else{
            NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
        }
    }];
 
}

- (void)setTweet:(Tweet *)tweet{
    _tweet = tweet;
    self.userName.text = tweet.user.name;
    self.userScreenName.text = tweet.user.screenName;
    self.date.text = tweet.createdAtString;
    self.tweetText.text = tweet.text;
    [self.favoriteButton setTitle:[NSString stringWithFormat:@"%i", self.tweet.favoriteCount]forState:UIControlStateNormal];
    
    if (self.tweet.favorited) {
        [self.favoriteButton setImage:[UIImage imageNamed:@"favor-icon-red"] forState:UIControlStateNormal];
    } else {
        [self.favoriteButton setImage:[UIImage imageNamed:@"favor-icon"] forState:UIControlStateNormal];
    }
    

}


@end
