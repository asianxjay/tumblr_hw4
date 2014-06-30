//
//  loginViewController.m
//  Tumblr
//
//  Created by Jason Demetillo on 6/28/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "loginViewController.h"

@interface loginViewController ()


@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

- (IBAction)onCancel:(id)sender;

- (void)loginBox;

@end

@implementation loginViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)loginBox {
    [self.emailField becomeFirstResponder];
    self.loginView.center = CGPointMake(160, 600);
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.loginView.center = CGPointMake(160, 200);
    } completion:^(BOOL finished) {
        // done
    }];
}
@end
