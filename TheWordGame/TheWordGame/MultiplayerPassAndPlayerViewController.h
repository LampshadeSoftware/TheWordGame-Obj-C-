//
//  MultiplayerPassAndPlayerViewController.h
//  TheWordGame
//
//  Created by Rio Lynk on 4/9/15.
//  Copyright (c) 2015 Daniel McCrystal. All rights reserved.
//

#import "LSSGame.h"
#import <UIKit/UIKit.h>

@interface MultiplayerPassAndPlayerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *inputTextBox;
@property (weak, nonatomic) IBOutlet UILabel *invalidWordLog;
@property (weak, nonatomic) IBOutlet UILabel *currentWord;
@property (weak, nonatomic) IBOutlet UILabel *lastWord0;
@property (weak, nonatomic) IBOutlet UILabel *lastWord1;
@property (weak, nonatomic) IBOutlet UILabel *lastWord2;
@property (weak, nonatomic) IBOutlet UILabel *wordCountingLabel;

@property (strong, nonatomic) LSSGame *currentGame;


@end
