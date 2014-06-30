//
//  activityViewController.m
//  Tumblr
//
//  Created by Jason Demetillo on 6/27/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "activityViewController.h"
#import "loginViewController.h"

@interface activityViewController ()

@property (strong, nonatomic) loginViewController *loginViewController;
@property (strong, nonatomic) IBOutlet UIScrollView *onScroll;

- (IBAction)onLogin:(id)sender;

@end

@implementation activityViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.loginViewController = [[loginViewController alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.loginViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onLogin:(id)sender {
    [self.view.window.rootViewController presentViewController:self.loginViewController animated:YES completion:nil];
    
    [self.loginViewController performSelector:@selector(loginBox) withObject:nil afterDelay:0.1];
}
@end
