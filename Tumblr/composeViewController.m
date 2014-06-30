//
//  composeViewController.m
//  Tumblr
//
//  Created by Jason Demetillo on 6/27/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "composeViewController.h"

@interface composeViewController ()

- (IBAction)onDismiss:(id)sender;

@end

@implementation composeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIBarButtonItem *onDismiss = [[UIBarButtonItem alloc] initWithTitle:@"Nevermind" style:UIBarButtonItemStyleDone target:self action:@selector(onDismiss:)];
    self.navigationItem.rightBarButtonItem = onDismiss;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onDismiss:(id)sender {
    NSLog(@"Dismiss");
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
