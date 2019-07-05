//
//  TweetCell.m
//  twitter
//
//  Created by antiriby on 7/1/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "Tweet.h"
#import "TweetCell.h"
#import "APIManager.h"

@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.favoriteButton setImage:[UIImage imageNamed:@"favor-icon"] forState:UIControlStateNormal];
    [self.favoriteButton setImage:[UIImage imageNamed:@"favor-icon-red"] forState:UIControlStateSelected];


}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (IBAction)didTapFavorite:(id)sender {
    // TODO: Update the local tweet model
    if (self.tweet.favorited) {
        // TODO: Send a POST request to the POST favorites/create endpoint
        self.tweet.favorited = NO;
        self.tweet.favoriteCount -= 1;
        // TODO: Update cell UI
        [self.favoriteButton setTitle:[NSString stringWithFormat:@"%i", self.tweet.favoriteCount]forState:UIControlStateNormal];
        [self.favoriteButton setImage:[UIImage imageNamed:@"favor-icon"] forState:UIControlStateNormal];
        [[APIManager shared] unFavorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error unfavoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully unfavorited the following Tweet: %@", tweet.text);
            }
        }];
        
    } else {
        
        self.tweet.favorited = YES;
        self.tweet.favoriteCount += 1;
        // TODO: Update cell UI
        [self.favoriteButton setTitle:[NSString stringWithFormat:@"%i", self.tweet.favoriteCount]forState:UIControlStateNormal];
        [self.favoriteButton setImage:[UIImage imageNamed:@"favor-icon-red"] forState:UIControlStateNormal];
        [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
            }
        }];
    }
    self.favoriteButton.selected = self.tweet.favorited;
}

- (IBAction)didTapRetweet:(id)sender {
    // TODO: Update the local tweet model
    if (self.tweet.retweeted) {
        // TODO: Send a POST request to the POST favorites/create endpoint
        self.tweet.retweeted = NO;
        self.tweet.retweetCount -= 1;
        // TODO: Update cell UI
        [self.retweetButton setTitle:[NSString stringWithFormat:@"%i", self.tweet.retweetCount]forState:UIControlStateNormal];
        [self.retweetButton setImage:[UIImage imageNamed:@"retweet-icon"] forState:UIControlStateNormal];
        [[APIManager shared] unRetweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error unretweeting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully unretweeted the following Tweet: %@", tweet.text);
            }
        }];
        
    } else {
        
        self.tweet.retweeted = YES;
        self.tweet.retweetCount += 1;
        // TODO: Update cell UI
        [self.retweetButton setTitle:[NSString stringWithFormat:@"%i", self.tweet.retweetCount]forState:UIControlStateNormal];
        [self.retweetButton setImage:[UIImage imageNamed:@"retweet-icon-green"] forState:UIControlStateNormal];
        [[APIManager shared] retweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error retweeting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully retweeted the following Tweet: %@", tweet.text);
            }
        }];
    }
    self.retweetButton.selected = self.tweet.retweeted;
}

- (void)setTweet:(Tweet *)tweet{
    _tweet = tweet;
    self.userName.text = tweet.user.name;
    self.userScreenName.text = tweet.user.screenName;
    self.date.text = tweet.createdAtString;
    self.tweetText.text = tweet.text;
    
    //this is the fix
    
    self.favoriteButton.selected = tweet.favorited;
    self.retweetButton.selected = tweet.retweeted;
    [self.favoriteButton setTitle:[NSString stringWithFormat:@"%i", self.tweet.favoriteCount]forState:UIControlStateNormal];
    [self.retweetButton setTitle:[NSString stringWithFormat:@"%i", self.tweet.retweetCount]forState:UIControlStateNormal];
}


@end
