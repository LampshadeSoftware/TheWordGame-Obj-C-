//
//  MultiplayerPassAndPlayPlayerInputViewController.m
//  TheWordGame
//
//  Created by Rio Lynk on 4/8/15.
//  Copyright (c) 2015 Daniel McCrystal. All rights reserved.
//

#import "MultiplayerPassAndPlayPlayerInputViewController.h"

@interface MultiplayerPassAndPlayPlayerInputViewController ()

@end

@implementation MultiplayerPassAndPlayPlayerInputViewController

NSArray *playerLabels;

- (void)viewDidLoad {
    [super viewDidLoad];
    _playerNameInput.returnKeyType = UIReturnKeyDone;
    [_playerNameInput becomeFirstResponder];
    _playerNameInput.delegate = self;
    playerLabels = [NSArray arrayWithObjects:_player1Label,
                    _player2Label,
                    _player3Label,
                    _player4Label,
                    _player5Label,
                    _player6Label,
                    _player7Label,
                    _player8Label
                    ,nil];
    _PPplayerNames = [[NSMutableArray alloc] init];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    
    
    [_PPplayerNames addObject:_playerNameInput.text];
    
    for(int i=0; i<[_PPplayerNames count]; i++) {
        UILabel *tmp = playerLabels[i];
        tmp.text = _PPplayerNames[i];
    }
    
    return YES;
}


@end
