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
    
    _playerNameInput.returnKeyType = UIReturnKeyDone;
    [_playerNameInput becomeFirstResponder];
    _playerNameInput.delegate = self;
    
    
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    
    [_PPplayerNames addObject:_playerNameInput.text];
    

    
    return YES;
}


@end
