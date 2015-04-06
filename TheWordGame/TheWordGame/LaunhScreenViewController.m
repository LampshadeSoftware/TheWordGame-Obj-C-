//
//  LaunhScreenViewController.m
//  TheWordGame
//
//  Created by Cowboy Lynk on 4/6/15.
//  Copyright (c) 2015 Daniel McCrystal. All rights reserved.
//

#import "LaunhScreenViewController.h"

@interface LaunhScreenViewController ()

@end

@implementation LaunhScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)startSbbutton:(id)sender {
    
    
    spbutton.animationImages = [NSArray arrayWithObjects:
                                
                                [UIImage imageNamed:@"SinglePlayer_00000.png"],
                                [UIImage imageNamed:@"SinglePlayer_00001.png"],
                                [UIImage imageNamed:@"SinglePlayer_00002.png"],
                                [UIImage imageNamed:@"SinglePlayer_00003.png"],
                                [UIImage imageNamed:@"SinglePlayer_00004.png"],
                                [UIImage imageNamed:@"SinglePlayer_00005.png"],
                                [UIImage imageNamed:@"SinglePlayer_00006.png"],
                                [UIImage imageNamed:@"SinglePlayer_00007.png"], nil];
    
    [spbutton setAnimationRepeatCount:1];
    spbutton.animationDuration = 1.5;
    [spbutton startAnimating];
                                
    
    
}


@end
