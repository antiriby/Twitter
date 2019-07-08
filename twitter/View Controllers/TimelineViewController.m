//
//  TimelineViewController.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TimelineViewController.h"
#import "ComposeViewController.h"
#import "UIImageView+AFNetworking.h"
#import "APIManager.h"
#import "TweetCell.h"
#import "AppDelegate.h"
#import "LoginViewController.h"

@interface TimelineViewController () <UITableViewDelegate, UITableViewDataSource, ComposeViewControllerDelegate>
//Pointing the delegate and the datasource pointers to the ViewController from the tableView tells the tableView where it will get the data from that you want to display

//Step 1
// View controller has a tableView as a subview
@property (nonatomic, weak) IBOutlet UITableView *timelineTableView;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@end

@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //Step 3
    //View controller becomes its dataSource and delegate in viewDidLoad
    self.timelineTableView.dataSource = self;
    self.timelineTableView.delegate = self;
    
    //Refresh Control Initialization
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(fetchTweets) forControlEvents:UIControlEventValueChanged];
    [self.timelineTableView insertSubview:self.refreshControl atIndex: 0];
    [self.timelineTableView addSubview:self.refreshControl];
    
    //Make API request and display tweets
    [self fetchTweets];
}

-(void)fetchTweets {
    //Step 4
    //Make an API request
        //Calling [APIManager shared] creates an instance of the APIManager
        //Calling the completion block prevents us from blocking our app.
        //This allows us to continue setting up the refresh control, displaying the timeline, etc.
        //even if we are not successful in receiving data from the API.
    [[APIManager shared] getHomeTimelineWithCompletion:^(NSArray *tweets, NSError *error) {
        //Step 5
        //API manager calls the completion handler passing back data
        if (tweets) {
            NSLog(@"😎😎😎 Successfully loaded home timeline");
            //Step 6
            //View controller stores that data passed into the completion handler
            self.tweetsArray = (NSMutableArray *)tweets;
            //Step7
            //Reload the table view
            [self.timelineTableView reloadData];
            [self.refreshControl endRefreshing];
        } else {
            NSLog(@"😫😫😫 Error getting home timeline: %@", error.localizedDescription);
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


//Step 8
//Table view asks its dataSource for numberOfRows & cellForRowAt
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    //Step 10:
    //cellForRow returns an instance of the custom cell with that reuse identifier
    //with it’s elements populated with data at the index asked for
    TweetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetCell" forIndexPath:indexPath];
    Tweet *tweet = self.tweetsArray[indexPath.row];    
    cell.tweet = tweet;
    
    //Set profile image view
    NSURL *profilePictureURL = [NSURL URLWithString:tweet.user.profileImageURL];
    [cell.userImageView setImageWithURL:profilePictureURL];
            
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //Step 9
    //numberOfRows returns the number of items returned from the API
    return self.tweetsArray.count;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UINavigationController *navigationController = [segue destinationViewController];
    ComposeViewController *composeController = (ComposeViewController*)navigationController.topViewController;
    composeController.delegate = self;
}

- (void)didTweet:(nonnull Tweet *)tweet {
    [self.tweetsArray addObject:tweet];
    [self fetchTweets];
    [self.timelineTableView reloadData];
}

- (IBAction)didTapLogout:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    appDelegate.window.rootViewController = loginViewController;
    [[APIManager shared] logout];     //Clears out the token
}

@end
