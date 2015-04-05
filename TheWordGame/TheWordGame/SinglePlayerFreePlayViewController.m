//
//  SinglePlayerFreePlayViewController.m
//  TheWordGame
//
//  Created by Daniel McCrystal on 4/4/15.
//  Copyright (c) 2015 Daniel McCrystal. All rights reserved.
//

#import "SinglePlayerFreePlayViewController.h"

@interface SinglePlayerFreePlayViewController ()


@end

@implementation SinglePlayerFreePlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Dictionary" ofType:@"txt"];
    NSString *entireDictionary = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    dictionary = [entireDictionary componentsSeparatedByString:@"\n"];
    
    _currentWord.text = @"word";
    _lastWord0.text = @"";
    _lastWord1.text = @"";
    _lastWord2.text = @"";
    _invalidWordLog.text = @"";
    usedWords = [NSMutableArray arrayWithObjects:@"", @"", _currentWord.text, nil];
    _inputTextBox.returnKeyType = UIReturnKeyDone;
    [_inputTextBox becomeFirstResponder];
    _inputTextBox.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
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
    return YES;
}

NSString *invalidMessage = @"";
NSMutableArray *usedWords;
NSArray *dictionary;


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
