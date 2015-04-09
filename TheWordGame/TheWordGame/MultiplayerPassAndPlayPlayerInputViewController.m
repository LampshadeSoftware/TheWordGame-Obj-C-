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

- (void)viewDidLoad {
    [super viewDidLoad];
    _PPplayerNames = [NSMutableArray arrayWithObjects:@"", @"", @"", @"", @"", @"", @"", @"", nil];
    _playerNameInput.returnKeyType = UIReturnKeyDone;
    [_playerNameInput becomeFirstResponder];
    _playerNameInput.delegate = self;
    
    
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    
    [_PPplayerNames addObject:_playerNameInput.text];
    
    _player1Label.text = _PPplayerNames[[_PPplayerNames count] -1];
    _player2Label.text = _PPplayerNames[[_PPplayerNames count] -2];
    _player3Label.text = _PPplayerNames[[_PPplayerNames count] -3];
    _player4Label.text = _PPplayerNames[[_PPplayerNames count] -4];
    _player5Label.text = _PPplayerNames[[_PPplayerNames count] -5];
    _player6Label.text = _PPplayerNames[[_PPplayerNames count] -6];
    _player7Label.text = _PPplayerNames[[_PPplayerNames count] -7];
    _player8Label.text = _PPplayerNames[[_PPplayerNames count] -8];
    
    if ((_playerNameInput.text = _PPplayerNames[[_PPplayerNames count] -2])) {
        _sameNameLabel.text = @"Please enter a new name.";
    }
    
    
    return YES;
}


@end
