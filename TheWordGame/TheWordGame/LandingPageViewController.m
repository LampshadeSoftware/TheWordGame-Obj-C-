//
//  LandingPageViewController.m
//  TheWordGame
//
//  Created by Cowboy Lynk on 4/6/15.
//  Copyright (c) 2015 Daniel McCrystal. All rights reserved.
//

#import "LandingPageViewController.h"

@interface LandingPageViewController ()

@end

@implementation LandingPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)startSinglePlayer:(id)sender {
    
    
    singleplayer.animationImages =
    [NSArray arrayWithObjects:
     [UIImage imageNamed:@"sp1.png"],
     [UIImage imageNamed:@"sp2.png"],
     [UIImage imageNamed:@"sp3.png"],
     [UIImage imageNamed:@"sp4.png"],
     [UIImage imageNamed:@"sp5.png"],
     [UIImage imageNamed:@"sp6.png"],
     [UIImage imageNamed:@"sp7.png"],
     [UIImage imageNamed:@"sp8.png"], nil];
    singleplayer.animationDuration = 0.7;
    [singleplayer setAnimationRepeatCount:1];
    [singleplayer startAnimating];
    
}


-(IBAction)startMultiPlayer:(id)sender {
    
    
    multiplayer.animationImages =
    [NSArray arrayWithObjects:
     [UIImage imageNamed:@"mp1.png"],
     [UIImage imageNamed:@"mp2.png"],
     [UIImage imageNamed:@"mp3.png"],
     [UIImage imageNamed:@"mp4.png"],
     [UIImage imageNamed:@"mp5.png"],
     [UIImage imageNamed:@"mp6.png"],
     [UIImage imageNamed:@"mp7.png"],
     [UIImage imageNamed:@"mp8.png"], nil];
    multiplayer.animationDuration = 0.7;
    [multiplayer setAnimationRepeatCount:1];
    [multiplayer startAnimating];
    
}

@end
