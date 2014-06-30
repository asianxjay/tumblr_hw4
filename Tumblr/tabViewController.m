//
//  tabViewController.m
//  Tumblr
//
//  Created by Jason Demetillo on 6/27/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "tabViewController.h"
#import "homeViewController.h"
#import "searchViewController.h"
#import "composeViewController.h"
#import "friendsViewController.h"
#import "activityViewController.h"
#import "loginViewController.h"

@interface tabViewController ()

@property (strong, nonatomic) homeViewController *homeViewController;

@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UIImageView *exploreButton;

- (IBAction)onLogin:(id)sender;
- (IBAction)onHome:(id)sender;
- (IBAction)onSearching:(id)sender;
- (IBAction)onCompose:(id)sender;
- (IBAction)onFriends:(id)sender;
- (IBAction)onActivity:(id)sender;

@property (nonatomic, strong)
UINavigationController *homeController;
@property (nonatomic, strong)
searchViewController *searchViewController;
@property (nonatomic, strong)
composeViewController *composeViewController;
@property (nonatomic, strong)
friendsViewController *friendsViewController;
@property (nonatomic, strong)
activityViewController *activityViewController;
@property (nonatomic) BOOL firstLoad;
@property (strong, nonatomic) loginViewController *loginViewController;

- (void) showExplore;
- (void) hideExplore;

@end

@implementation tabViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self){
        self.homeViewController = [[homeViewController alloc] init];
        self.searchViewController = [[searchViewController alloc] init];
        self.activityViewController = [[activityViewController alloc] init];
        self.friendsViewController = [[friendsViewController alloc] init];
        self.composeViewController = [[composeViewController alloc] init];
        // Custom initialization
         self.loginViewController = [[loginViewController alloc] init];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.homeViewController.view.frame = self.contentView.frame;
    [self.contentView addSubview:self.homeViewController.view];
    
    self.firstLoad = YES;
    [self performSelector:@selector(showExplore) withObject:nil afterDelay:0.1];
    
     self.loginViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) showExplore {
    
    CGPoint originalLocation = CGPointMake(self.exploreButton.center.x, 490);
    
    if (self.exploreButton.alpha == 0 || self.firstLoad) {
        self.firstLoad = NO;
        // first, move up the bubble
        [UIView animateWithDuration:0.5 delay:0 options: UIViewAnimationOptionCurveEaseOut animations:^{
            self.exploreButton.center = CGPointMake(originalLocation.x, originalLocation.y);
            self.exploreButton.alpha = 1;
        } completion:^(BOOL finished) {
            // then, make it bob up and down
            [UIView animateWithDuration:1.5 delay:0 options:(UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat) animations:^{
                self.exploreButton.center = CGPointMake(originalLocation.x, originalLocation.y + 10);
            } completion:nil];
        }];
    }
}

- (void) hideExplore {
    
    CGPoint originalLocation = CGPointMake(self.exploreButton.center.x, 490);
    
    if (self.exploreButton.alpha == 1) {
        // fade the bubble out
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.exploreButton.alpha = 0;
            self.exploreButton.center = CGPointMake(originalLocation.x, 530);
        } completion:nil];
    }
}

- (IBAction)onLogin:(id)sender {
    [self.view.window.rootViewController presentViewController:self.loginViewController animated:YES completion:nil];
    
    [self.loginViewController performSelector:@selector(loginBox) withObject:nil afterDelay:0.1];
}

- (IBAction)onHome:(id)sender {
    NSLog(@"Tapped Home");
    self.homeViewController.view.frame = self.contentView.frame;
    [self.contentView addSubview:self.homeViewController.view];
     [self showExplore];
}

- (IBAction)onSearching:(id)sender {
    NSLog(@"Tapped Search");
    self.searchViewController.view.frame = self.contentView.frame;
    [self.contentView addSubview:self.searchViewController.view];
    [self hideExplore];
}

- (IBAction)onCompose:(id)sender {
    NSLog(@"Tapped Compose");

    UIViewController *vc = [[composeViewController alloc] init];
    vc.modalTransitionStyle = UIModalTransitionStyleCoverVertical; // Rises from below
    
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)onFriends:(id)sender {
    NSLog(@"Tapped Friends");
    self.friendsViewController.view.frame = self.contentView.frame;
    [self.contentView addSubview:self.friendsViewController.view];
    [self showExplore];
}
- (IBAction)onActivity:(id)sender {
    NSLog(@"Tapped Friends");
    self.activityViewController.view.frame = self.contentView.frame;
    [self.contentView addSubview:self.activityViewController.view];
    [self showExplore];
}

@end
