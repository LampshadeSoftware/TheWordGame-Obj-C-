//
//  ViewController.m
//  TheWordGame
//
//  Created by Daniel McCrystal on 4/1/15.
//  Copyright (c) 2015 Daniel McCrystal. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

BOOL isValidPlay(NSString *newWord, NSString *currentWord);
BOOL restOfWordIsSame(NSString *newWord, NSString *currentWord, NSUInteger index, NSUInteger offset);
BOOL isValidAdd(NSString *newWord, NSString *currentWord);
BOOL isValidSub(NSString *newWord, NSString *currentWord);
BOOL isValidSwap(NSString *newWord, NSString *currentWord);

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _currentWordValue.text = @"word";
    _lastWord0.text = @"";
    _lastWord1.text = @"";
    _lastWord2.text = @"";
    usedWords = [NSMutableArray arrayWithObjects:@"", @"", _currentWordValue.text, nil];
    _textBoxValue.returnKeyType = UIReturnKeyDone;
    [_textBoxValue becomeFirstResponder];
    _textBoxValue.delegate = self;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)submitWord:(id)sender {
    if(isValidPlay(_textBoxValue.text, _currentWordValue.text)) {
        _invalidWordLog.text = @"";
        _currentWordValue.text = _textBoxValue.text;
        _lastWord0.text = usedWords[[usedWords count] - 1];
        _lastWord1.text = usedWords[[usedWords count] - 2];
        _lastWord2.text = usedWords[[usedWords count] - 3];
        [usedWords addObject:_textBoxValue.text];
    }
    else {
        _invalidWordLog.text = invalidMessage;
    }
    _textBoxValue.text = @"";
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [self submitWord:self];
    return YES;
}

NSString *invalidMessage = @"";
NSMutableArray *usedWords;

void updateMessage(NSString *message) {
    invalidMessage = message;
}

BOOL isValidPlay(NSString *newWord, NSString *currentWord) {
    updateMessage(@"Invalid play!");
    
    if([newWord isEqualToString: @""]) {
        updateMessage(@"You didn't type anything.");
        return NO;
    }
    
    for(NSString *word in usedWords) {
        if([word isEqualToString: newWord]) {
            updateMessage([word stringByAppendingString: @" has already been played."]);
            return NO;
        }
    }
    
    return isValidAdd(newWord, currentWord) || isValidSub(newWord, currentWord) || isValidSwap(newWord, currentWord);
    
}

BOOL restOfWordIsSame(NSString *newWord, NSString *currentWord, NSUInteger index, NSUInteger offset) {
    for (NSUInteger i = index + 1; i < newWord.length; i++) {
        if ([newWord characterAtIndex: i] != [currentWord characterAtIndex: i - offset]) {
            return NO;
        }
    }
    return YES;
}

BOOL isValidAdd(NSString *newWord, NSString *currentWord) {
    if(newWord.length != currentWord.length + 1) {
        return NO;
    }
    
    NSUInteger indexOfNewChar = -1;
    for (int i = 0; i < currentWord.length; i++) {
        
        if ([newWord characterAtIndex: i] != [currentWord characterAtIndex: i]) {
            indexOfNewChar = i;
            break;
        }
    }
    if (indexOfNewChar == -1) {
        indexOfNewChar = newWord.length - 1;
        
        if([newWord characterAtIndex: indexOfNewChar] == 's') {
            updateMessage(@"Cannot simply add 's'");
            return NO;
        }
        if([newWord characterAtIndex: indexOfNewChar - 1] == 'e' && [newWord characterAtIndex: indexOfNewChar] == 'd') {
            updateMessage(@"Cannot simply make verb past tense... Phillip");
            return NO;
        }
    }
    
    if (restOfWordIsSame(newWord, currentWord, indexOfNewChar, 1)) {
        return YES;
    }
    
    return NO;
}

BOOL isValidSub(NSString *newWord, NSString *currentWord) {
    if (newWord.length != currentWord.length - 1) {
        return NO;
    }
    
    NSUInteger indexOfDeletedChar = -1;
    for (int i = 0; i < newWord.length; i++) {
        if ([newWord characterAtIndex: i] != [currentWord characterAtIndex: i]) {
            indexOfDeletedChar = i;
            break;
        }
    }
    if (indexOfDeletedChar == -1) {
        indexOfDeletedChar = currentWord.length - 1;
    }
    if (restOfWordIsSame(newWord, currentWord, indexOfDeletedChar - 1, -1)) {
        return YES;
    }
    return NO;
}

BOOL isValidSwap(NSString *newWord, NSString *currentWord) {
    if (newWord.length != currentWord.length) {
        return NO;
    }
    NSUInteger indexOfSwappedChar = -1;
    for (int i = 0; i < newWord.length; i++) {
        if ([newWord characterAtIndex: i] != [currentWord characterAtIndex: i]) {
            indexOfSwappedChar = i;
            break;
        }
    }
    if (indexOfSwappedChar != -1
        && restOfWordIsSame(newWord, currentWord, indexOfSwappedChar, 0)) {
        return YES;
    }
    return NO;
}



@end