//
//  SinglePlayerTimeTrialViewController.h
//  TheWordGame
//
//  Created by Rio Lynk on 4/7/15.
//  Copyright (c) 2015 Daniel McCrystal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SinglePlayerTimeTrialViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *inputTextBox;
@property (weak, nonatomic) IBOutlet UILabel *invalidWordLog;
@property (weak, nonatomic) IBOutlet UILabel *currentWord;
@property (weak, nonatomic) IBOutlet UILabel *lastWord0;
@property (weak, nonatomic) IBOutlet UILabel *lastWord1;
@property (weak, nonatomic) IBOutlet UILabel *lastWord2;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UILabel *wordCountingLabel;


@end
NSTimer *countdownTimer;
int secondsCount;
int wordCountInt;