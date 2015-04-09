//
//  MultiplayerPassAndPlayPlayerInputViewController.h
//  TheWordGame
//
//  Created by Rio Lynk on 4/8/15.
//  Copyright (c) 2015 Daniel McCrystal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MultiplayerPassAndPlayPlayerInputViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *player1Label;
@property (weak, nonatomic) IBOutlet UILabel *player2Label;
@property (weak, nonatomic) IBOutlet UILabel *player3Label;
@property (weak, nonatomic) IBOutlet UILabel *player4Label;
@property (weak, nonatomic) IBOutlet UILabel *player5Label;
@property (weak, nonatomic) IBOutlet UILabel *player6Label;
@property (weak, nonatomic) IBOutlet UILabel *player7Label;
@property (weak, nonatomic) IBOutlet UILabel *player8Label;
@property (weak, nonatomic) IBOutlet UITextField *playerNameInput;

@property (strong) NSMutableArray *PPplayerNames;


@end
