//
//  searchViewController.m
//  Tumblr
//
//  Created by Jason Demetillo on 6/27/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "searchViewController.h"

@interface searchViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *slideScroll;

@end

@implementation searchViewController

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
    self.slideScroll.contentSize = CGSizeMake(320, 1180);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
