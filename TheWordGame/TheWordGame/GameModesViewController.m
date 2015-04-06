//
//  SinglePlayerGameModesViewController.m
//  TheWordGame
//
//  Created by Cowboy Lynk on 4/6/15.
//  Copyright (c) 2015 LampshadeStudios. All rights reserved.
//

#import "GameModesViewController.h"

@interface GameModesViewController ()

@end

@implementation GameModesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)startFreeplay:(id)sender {
    
    
    freeplay.animationImages =
    [NSArray arrayWithObjects:
     [UIImage imageNamed:@"button1.png"],
     [UIImage imageNamed:@"button2.png"],
     [UIImage imageNamed:@"button3.png"],
     [UIImage imageNamed:@"button4.png"],
     [UIImage imageNamed:@"button5.png"],
     [UIImage imageNamed:@"button6.png"],
     [UIImage imageNamed:@"button7.png"],
     [UIImage imageNamed:@"button8.png"],
     [UIImage imageNamed:@"button9.png"],
     [UIImage imageNamed:@"button10.png"],
     [UIImage imageNamed:@"button11.png"],
     [UIImage imageNamed:@"button12.png"],
     [UIImage imageNamed:@"button13.png"],
     [UIImage imageNamed:@"button14.png"],
     [UIImage imageNamed:@"button15.png"], nil];
    freeplay.animationDuration = 0.7;
    [freeplay setAnimationRepeatCount:1];
    [freeplay startAnimating];
    
}
    
-(IBAction)startTimeTrial:(id)sender {
    
    timetrial.animationImages =
    [NSArray arrayWithObjects:
     [UIImage imageNamed:@"button1.png"],
     [UIImage imageNamed:@"button2.png"],
     [UIImage imageNamed:@"button3.png"],
     [UIImage imageNamed:@"button4.png"],
     [UIImage imageNamed:@"button5.png"],
     [UIImage imageNamed:@"button6.png"],
     [UIImage imageNamed:@"button7.png"],
     [UIImage imageNamed:@"button8.png"],
     [UIImage imageNamed:@"button9.png"],
     [UIImage imageNamed:@"button10.png"],
     [UIImage imageNamed:@"button11.png"],
     [UIImage imageNamed:@"button12.png"],
     [UIImage imageNamed:@"button13.png"],
     [UIImage imageNamed:@"button14.png"],
     [UIImage imageNamed:@"button15.png"], nil];
    timetrial.animationDuration = 0.7;
    [timetrial setAnimationRepeatCount:1];
    [timetrial startAnimating];
    
}
    
    
-(IBAction)startLevels:(id)sender {
    
    levels.animationImages =
    [NSArray arrayWithObjects:
     [UIImage imageNamed:@"button1.png"],
     [UIImage imageNamed:@"button2.png"],
     [UIImage imageNamed:@"button3.png"],
     [UIImage imageNamed:@"button4.png"],
     [UIImage imageNamed:@"button5.png"],
     [UIImage imageNamed:@"button6.png"],
     [UIImage imageNamed:@"button7.png"],
     [UIImage imageNamed:@"button8.png"],
     [UIImage imageNamed:@"button9.png"],
     [UIImage imageNamed:@"button10.png"],
     [UIImage imageNamed:@"button11.png"],
     [UIImage imageNamed:@"button12.png"],
     [UIImage imageNamed:@"button13.png"],
     [UIImage imageNamed:@"button14.png"],
     [UIImage imageNamed:@"button15.png"], nil];
    levels.animationDuration = 0.7;
    [levels setAnimationRepeatCount:1];
    [levels startAnimating];
    
    
}

@end
