//
//  SinglePlayerFreePlayViewController.m
//  TheWordGame
//
//  Created by Daniel McCrystal on 4/4/15.
//  Copyright (c) 2015 Daniel McCrystal. All rights reserved.
//

#import "SinglePlayerFreePlayViewController.h"
#import "LSSGame.h"

@interface SinglePlayerFreePlayViewController ()


@end

@implementation SinglePlayerFreePlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSMutableArray *savedGames = [LSSGame getSavedSinglePlayerFreePlayGames];
    
    if([savedGames count] == 0) {
        _currentGame = [[LSSGame alloc] init];
        [savedGames addObject:_currentGame];
    }
    else if(_currentGame == nil){
        _currentGame = savedGames[[savedGames count]-1];
    }
    
    _currentWord.text = _currentGame.currentWord;
    _lastWord0.text = _currentGame.usedWords[[_currentGame.usedWords count] - 2];
    _lastWord1.text = _currentGame.usedWords[[_currentGame.usedWords count] - 3];
    _lastWord2.text = _currentGame.usedWords[[_currentGame.usedWords count] - 4];
    _invalidWordLog.text = _currentGame.logMessage;
    _wordCountingLabel.text = [NSString stringWithFormat:@"%d", _currentGame.wordCount];
    
    _inputTextBox.returnKeyType = UIReturnKeyDone;
    [_inputTextBox becomeFirstResponder];
    _inputTextBox.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    if([_currentGame isValidPlay:_inputTextBox.text onWord:_currentGame.currentWord]) {
        _currentGame.logMessage = @"";
        _invalidWordLog.text = @"";
        _currentWord.text = _inputTextBox.text;
        _currentGame.currentWord = _inputTextBox.text;
        _lastWord0.text = _currentGame.usedWords[[_currentGame.usedWords count] - 1];
        _lastWord1.text = _currentGame.usedWords[[_currentGame.usedWords count] - 2];
        _lastWord2.text = _currentGame.usedWords[[_currentGame.usedWords count] - 3];
        [_currentGame.usedWords addObject:_inputTextBox.text];
        _currentGame.wordCount++;
        NSString *wordCounter = [NSString stringWithFormat:@"%d", _currentGame.wordCount];
        _wordCountingLabel.text = wordCounter;
    }
    else {
        _invalidWordLog.text = _currentGame.logMessage;
    }
    _inputTextBox.text = @"";
    
    return YES;
}
- (IBAction)generateNewWord:(id)sender {
    _currentWord.text = @"";
    
    _currentGame = [[LSSGame alloc] init];
    [self viewDidLoad];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
