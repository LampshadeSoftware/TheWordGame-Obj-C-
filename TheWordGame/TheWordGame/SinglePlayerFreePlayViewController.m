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

LSSGame *currentGame;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSMutableArray *savedGames = [LSSGame getSavedSinglePlayerFreePlayGames];
    
    if([savedGames count] == 0) {
        currentGame = [[LSSGame alloc] init];
        [savedGames addObject:currentGame];
    }
    else if(currentGame == nil){
        currentGame = savedGames[[savedGames count]-1];
    }
    
    _currentWord.text = currentGame.currentWord;
    _lastWord0.text = currentGame.usedWords[[currentGame.usedWords count] - 2];
    _lastWord1.text = currentGame.usedWords[[currentGame.usedWords count] - 3];
    _lastWord2.text = currentGame.usedWords[[currentGame.usedWords count] - 4];
    _invalidWordLog.text = currentGame.logMessage;
    
    _inputTextBox.returnKeyType = UIReturnKeyDone;
    [_inputTextBox becomeFirstResponder];
    _inputTextBox.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    if([currentGame isValidPlay:_inputTextBox.text onWord:currentGame.currentWord]) {
        _invalidWordLog.text = @"";
        _currentWord.text = _inputTextBox.text;
        currentGame.currentWord = _inputTextBox.text;
        _lastWord0.text = currentGame.usedWords[[currentGame.usedWords count] - 1];
        _lastWord1.text = currentGame.usedWords[[currentGame.usedWords count] - 2];
        _lastWord2.text = currentGame.usedWords[[currentGame.usedWords count] - 3];
        [currentGame.usedWords addObject:_inputTextBox.text];
        wordCountInt = wordCountInt +1;
        NSString *wordCounter = [NSString stringWithFormat:@"%d", wordCountInt];
        _wordCountingLabel.text = wordCounter;
    }
    else {
        _invalidWordLog.text = currentGame.logMessage;
    }
    _inputTextBox.text = @"";
    /*
    if(isValidPlay(_inputTextBox.text, _currentWord.text)) {
        _invalidWordLog.text = @"";
        _currentWord.text = _inputTextBox.text;
        _lastWord0.text = usedWords[[usedWords count] - 1];
        _lastWord1.text = usedWords[[usedWords count] - 2];
        _lastWord2.text = usedWords[[usedWords count] - 3];
        [usedWords addObject:_inputTextBox.text];
    }
    else {
        _invalidWordLog.text = invalidMessage;
    }
    _inputTextBox.text = @"";
     */
    return YES;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
