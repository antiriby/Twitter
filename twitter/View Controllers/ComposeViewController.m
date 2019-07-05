//
//  ComposeViewController.m
//  twitter
//
//  Created by antiriby on 7/2/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"
#import "APIManager.h"
#import "Tweet.h"

@interface ComposeViewController ()

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     Get the new view controller using [segue destinationViewController].ß
     Pass the selected object to the new view controller.
}
*/

- (IBAction)postComposedTweet:(id)sender {
    [[APIManager shared] postStatusWithText:self.textView.text completion:^(Tweet *tweet, NSError *error) {
        // code goes here
        // handle if an error happens
        // handle successful tweet composed
        
        if(error){
            NSLog(@"Error composing Tweet: %@", error.localizedDescription);
        }
        else{
            [self.delegate didTweet:tweet];
            NSLog(@"Compose Tweet Success!");
        }
        
   
    }];
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)closeComposedTweet:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)didTapLogout:(id)sender {
}
@end
