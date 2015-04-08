//
//  SinglePlayerTimeTrialViewController.m
//  TheWordGame
//
//  Created by Rio Lynk on 4/7/15.
//  Copyright (c) 2015 Daniel McCrystal. All rights reserved.
//

#import "SinglePlayerTimeTrialViewController.h"
#import "LSSGame.h"

@interface SinglePlayerTimeTrialViewController ()

@end

@implementation SinglePlayerTimeTrialViewController

LSSGame *currentGame;

- (void) showTimer {
    _secondsCount--;
    NSString *timerOutput = [NSString stringWithFormat:@"%d", _secondsCount];
    _timerLabel.text = timerOutput;
    if (_secondsCount == 0) {
        [_countdownTimer invalidate];
        _countdownTimer = nil;
        if (_wordCountInt <= 3){
            NSString *endWordCount = [NSString stringWithFormat:@"You suck and got %d words!", _wordCountInt];
            _currentWord.text = endWordCount;
        }
        if (_wordCountInt > 3 && _wordCountInt <= 10) {
            NSString * aboveThree = [NSString stringWithFormat:@"You got %d words", _wordCountInt];
            _currentWord.text = aboveThree;
        }
        if (_wordCountInt > 10) {
            NSString * aboveTen = [NSString stringWithFormat:@"Congrats you got %d words!", _wordCountInt];
            _currentWord.text = aboveTen;
        }
    }
}

- (void) setTimer {
    _secondsCount = 60;
    _countdownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(showTimer) userInfo:nil repeats:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTimer];
    
    currentGame = [[LSSGame alloc] init];
    
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
        _wordCountInt++;
        NSString *wordCounter = [NSString stringWithFormat:@"%d", _wordCountInt];
        _wordCountingLabel.text = wordCounter;
    }
    else {
        _invalidWordLog.text = currentGame.logMessage;
    }
    _inputTextBox.text = @"";

    return YES;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
