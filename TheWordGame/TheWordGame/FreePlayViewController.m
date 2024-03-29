//
//  FreePlayViewController.m
//  TheWordGame
//
//  Created by Daniel McCrystal on 4/4/15.
//  Copyright (c) 2015 Daniel McCrystal. All rights reserved.
//

#import "FreePlayViewController.h"

@interface FreePlayViewController ()

BOOL isValidPlay(NSString *newWord, NSString *currentWord);
BOOL restOfWordIsSame(NSString *newWord, NSString *currentWord, NSUInteger index, NSUInteger offset);
BOOL isValidAdd(NSString *newWord, NSString *currentWord);
BOOL isValidSub(NSString *newWord, NSString *currentWord);
BOOL isValidSwap(NSString *newWord, NSString *currentWord);
BOOL isEnglishWord(NSString *newWord);

@end

@implementation FreePlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Dictionary" ofType:@"txt"];
    NSString *entireDictionary = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    dictionary = [entireDictionary componentsSeparatedByString:@"\n"];
    
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
- (IBAction)devModeToggled:(id)sender {
    devModeOn = !devModeOn;
}

- (IBAction)submitWord:(id)sender {
    
    if(devModeOn) {
        usedWords = [NSMutableArray arrayWithObjects:@"", @"", _textBoxValue.text, nil];
        _lastWord0.text = @"";
        _lastWord1.text = @"";
        _lastWord2.text = @"";
        _invalidWordLog.text = @"";
        _currentWordValue.text = _textBoxValue.text;
    }
    
    else if(isValidPlay(_textBoxValue.text, _currentWordValue.text)) {
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

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [self submitWord:self];
    return YES;
}

NSString *invalidMessage = @"";
NSMutableArray *usedWords;
NSArray *dictionary;
BOOL devModeOn = NO;

void updateMessage(NSString *message) {
    invalidMessage = message;
}

BOOL isValidPlay(NSString *newWord, NSString *currentWord) {
    updateMessage(@"Invalid play!");
    
    if([newWord isEqualToString: @""]) {
        updateMessage(@"You didn't type anything.");
        return NO;
    }
    
    if([newWord isEqualToString:@"fjord"]) {
        updateMessage(@"Fuck off with that bullshit");
        return NO;
    }
    
    for(NSString *word in usedWords) {
        if([word isEqualToString: newWord]) {
            updateMessage([word stringByAppendingString: @" has already been played."]);
            return NO;
        }
    }
    
    if(isValidAdd(newWord, currentWord) || isValidSub(newWord, currentWord) || isValidSwap(newWord, currentWord)) {
        if(isEnglishWord(newWord)) {
            if(isValidAdd(newWord, usedWords[[usedWords count]-2]) || isValidSub(newWord, usedWords[[usedWords count]-2]) || isValidSwap(newWord, usedWords[[usedWords count]-2])) {
                updateMessage(@"Double play!");
                return NO;
            }
            return YES;
        }
    }
    return NO;
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

BOOL isEnglishWord(NSString *newWord) {
    for(NSString *word in dictionary) {
        if([newWord isEqualToString:word]) {
            return YES;
        }
    }
    
    updateMessage([NSString stringWithFormat:@"%@ is not an English word.", newWord]);
    return NO;
}



@end
