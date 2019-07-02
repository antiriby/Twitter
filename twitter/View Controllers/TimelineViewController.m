//
//  TimelineViewController.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TimelineViewController.h"
#import "APIManager.h"
#import "TweetCell.h"

@interface TimelineViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *timelineTableView;


@end

@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Get timeline
    [[APIManager shared] getHomeTimelineWithCompletion:^(NSArray *tweets, NSError *error) {
        if (tweets) {
            NSLog(@"😎😎😎 Successfully loaded home timeline");
            for (NSDictionary *dictionary in tweets) {
                NSString *text = dictionary[@"text"];
                NSLog(@"%@", text);
            }
        } else {
            NSLog(@"😫😫😫 Error getting home timeline: %@", error.localizedDescription);
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Requests Tweets from the API
//TODO: Update this method for Twitter instead of movies
- (void)fetchTweets {
//    NSURL *nowPlayingURL = [NSURL URLWithString:@"https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:nowPlayingURL cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
//    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
//    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//        if (error != nil) {
//            NSLog(@"%@", [error localizedDescription]);
//            //Alert Controller
//            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Network Error"
//                                                                           message:@"Unable to connect to internet."
//                                                                    preferredStyle:(UIAlertControllerStyleAlert)];
//            // OK action
//            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
//                                                             handler:^(UIAlertAction * _Nonnull action) {
//                                                                 // handle response here.
//                                                                 exit(0);
//                                                             }];
//            [alert addAction:okAction];
//
//            [self presentViewController:alert animated:YES completion:^{
//                // optional code for what happens after the alert controller has finished presenting
//            }];
//        }
//        else {
//
//            NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//
//            self.movies = dataDictionary[@"results"];
//            self.filteredMovies = self.movies;
//
//            [self.activityIndicator stopAnimating];
//            [self.tableView reloadData];
//            // TODO: Get the array of movies
//            // TODO: Store the movies in a property to use elsewhere
//            // TODO: Reload your table view data
//        }
//
//
//
//        [self.refreshControl endRefreshing];
//
//    }];
//    [task resume];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/




- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    //TODO: Make this the number of tweets
    return 20;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //TODO: Set up the Tweet Cell
    TweetCell cell = [[Tweet alloc] init];
    return cell;
}



@end
