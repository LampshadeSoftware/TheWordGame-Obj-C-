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
    
    // If there are no saved games...
    if([savedGames count] == 0) {
        // Set the current game to a new game
        _currentGame = [[LSSGame alloc] init];
        // Add the current game to the array of saved games
        [savedGames addObject:_currentGame];
    }
    // If there are saved games but currentGame is not set to any of them
    else if(_currentGame == nil){
        // Set the current game to the last saved game
        _currentGame = savedGames[[savedGames count]-1];
    }
    
    // Display the current word
    _currentWord.text = _currentGame.currentWord;
    // Set the trail words to the last 3 played words (blank strings in a new game)
    _lastWord0.text = _currentGame.usedWords[[_currentGame.usedWords count] - 2];
    _lastWord1.text = _currentGame.usedWords[[_currentGame.usedWords count] - 3];
    _lastWord2.text = _currentGame.usedWords[[_currentGame.usedWords count] - 4];
    // Display the current log message
    _invalidWordLog.text = _currentGame.logMessage;
    // Display the current word count
    _wordCountingLabel.text = [NSString stringWithFormat:@"%d", _currentGame.wordCount];
    
    // Set the return key to a done key
    _inputTextBox.returnKeyType = UIReturnKeyDone;
    // Bring the keyboard up automatically
    [_inputTextBox becomeFirstResponder];
    // No idea what this does, but we need it there
    _inputTextBox.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    // If the user played a valid word on the current word...
    if([_currentGame isValidPlay:_inputTextBox.text onWord:_currentGame.currentWord]) {
        // Clear the game's log message
        _currentGame.logMessage = @"";
        // Clear the display log
        _invalidWordLog.text = @"";
        // Set the displayed current word to the word entered by the user
        _currentWord.text = _inputTextBox.text;
        // Set the game's current word to the word entered by the user
        _currentGame.currentWord = _inputTextBox.text;
        // Update the trail words to show the last 3 words played
        _lastWord0.text = _currentGame.usedWords[[_currentGame.usedWords count] - 1];
        _lastWord1.text = _currentGame.usedWords[[_currentGame.usedWords count] - 2];
        _lastWord2.text = _currentGame.usedWords[[_currentGame.usedWords count] - 3];
        // Add the word entered by the user to the game's array of used words
        [_currentGame.usedWords addObject:_inputTextBox.text];
        // Increment the game's word count
        _currentGame.wordCount++;
        // Display the game's word count
        _wordCountingLabel.text = [NSString stringWithFormat:@"%d", _currentGame.wordCount];
    }
    // User did NOT play a valid word on the current word
    else {
        // Display the game's log message
        _invalidWordLog.text = _currentGame.logMessage;
    }
    // Clear the input text box
    _inputTextBox.text = @"";
    
    return YES;
}
- (IBAction)generateNewWord:(id)sender {
    // Set the current game to a new default game, which starts with a SmartRandom generated word
    _currentGame = [[LSSGame alloc] init];
    // Re-perform initial setup
    [self viewDidLoad];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
