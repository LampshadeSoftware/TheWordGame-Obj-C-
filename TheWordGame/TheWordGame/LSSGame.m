//
//  LSSGame.m
//  TheWordGame
//
//  Created by Daniel McCrystal on 4/5/15.
//  Copyright (c) 2015 Daniel McCrystal. All rights reserved.
//

#import "LSSGame.h"
#import "LSSDictionary.h"

@interface LSSGame ()

-(BOOL)restOfWordIsSame:(NSString *)newWord onWord:(NSString *)currentWord fromIndex:(int)index withOffset:(int)offset;
-(void)updateMessage:(NSString *)message;

@end

@implementation LSSGame

static NSMutableArray *savedSinglePlayerFreePlayGames;

+(void)initializeSaves {
    // Creates an NSMutableArray to store the saved games.
    savedSinglePlayerFreePlayGames = [[NSMutableArray alloc] init];
    NSLog(@"Single-player saves initialized");
}

+(NSMutableArray *)getSavedSinglePlayerFreePlayGames {
    return savedSinglePlayerFreePlayGames;
}

-(id)init:(NSString *)startWord {
    self = [super init];
    // Sets the game's current word to the supplied word.
    _currentWord = startWord;
    // Creates an array to store the used words with three blank values (so that the past words are
    // not nil at the start of the game) and the current word.
    _usedWords = [NSMutableArray arrayWithObjects:@"", @"", @"", _currentWord, nil];
    // Initializes the log message to a blank string.
    _logMessage = @"";
    // Initializes the initial word count to 0;
    _wordCount = 0;
    
    //NSLog(@"Created new game");
    return self;
}

- (id) init {
    self = [super init];
    // Sets the initial current word to a word generated from LSSDictionary's SmartRandom algorithm
    _currentWord = [LSSDictionary getSmartRandom];
    // Creates an array to store the used words with three blank values (so that the past words are
    // not nil at the start of the game) and the current word.
    _usedWords = [NSMutableArray arrayWithObjects:@"", @"", @"", _currentWord, nil];
    _logMessage = @"";
    
    NSLog(@"Created new game with word: %@", _currentWord);
    
    return self;
}

-(void)updateMessage:(NSString *)message {
    // Sets the log message to the NSString parameter.
    _logMessage = message;
}

-(BOOL)isValidPlay:(NSString *)newWord onWord:(NSString *)currentWord {
    // Updates to the log message to a default message if it is not changed throughout this method
    [self updateMessage:@"Invalid play!"];
    
    // If the new word is blank...
    if([newWord isEqualToString: @""]) {
        [self updateMessage:@"You didn't type anything."];
        return NO;
    }
    
    // If the new word is "fjord"...
    if([newWord isEqualToString:@"fjord"]) {
        [self updateMessage:@"You know goddamn well what you did."];
        return NO;
    }
    
    // Cycles through all the words in the usedWords array
    for(NSString *word in _usedWords) {
        // If the new word is the same as a word that is already in the array...
        if([word isEqualToString: newWord]) {
            [self updateMessage:[NSString stringWithFormat:@"%@ has already been played.", word]];
            return NO;
        }
    }
    
    // If the new word is a valid addition, subtraction, or swap on the current word...
    if([self isValidAdd:newWord onWord:currentWord] || [self isValidSub:newWord onWord:currentWord] || [self isValidSwap:newWord onWord:currentWord]) {
        // Uses an LSSDictionary method to check if the new word exists in the english dictionary
        if([LSSDictionary isEnglishWord:newWord]) {
            // Stores the second to last NSString in the usedWords in a temporary variable
            // (last element is the current word)
            NSString *lastWord = _usedWords[[_usedWords count] -2];
            // If the new word is a valid addition, subtraction, or swap on the LAST word...
            if([self isValidAdd:newWord onWord:lastWord] || [self isValidSub:newWord onWord:lastWord] || [self isValidSwap:newWord onWord:lastWord]) {
                [self updateMessage:@"Double play!"];
                return NO;
            }
            // Not double play
            return YES;
        }
        // Not English word
        else {
            [self updateMessage:[NSString stringWithFormat:@"%@ is not an English word.", newWord]];
        }
    }
    // Not valid play, default log message is used
    return NO;
}
-(BOOL)isValidAdd:(NSString *)newWord onWord:(NSString *)currentWord {
    // If the new word is not only one letter longer than the current word...
    if(newWord.length != currentWord.length + 1) {
        // Cannot be a valid addition
        return NO;
    }
    
    // A variable to store the index of the character that has been added
    int indexOfNewChar = -1;
    // Cycles through the indexes of the current word
    for (int i = 0; i < currentWord.length; i++) {
        // If the character in the new word at the current index is not equal to the
        // character in the current word at the current index...
        if ([newWord characterAtIndex: i] != [currentWord characterAtIndex: i]) {
            // Set the variable to the index
            indexOfNewChar = i;
            // Stop searching
            break;
        }
    }
    // If the index variable remains unchanged...
    if (indexOfNewChar == -1) {
        // The new character must be at the end of the word, so we can assume that for everything in this block.
        // Set the variable to the last index of the new word
        indexOfNewChar = (int)newWord.length - 1;
        
        // If the added character is an 's'...
        if([newWord characterAtIndex: indexOfNewChar] == 's') {
            [self updateMessage:@"Cannot simply add 's'"];
            return NO;
        }
        // If the last letter of the current word was 'e', and the user added a 'd' to the end...
        if([newWord characterAtIndex: indexOfNewChar - 1] == 'e' && [newWord characterAtIndex: indexOfNewChar] == 'd') {
            [self updateMessage:@"Cannot simply make verb past tense."];
            return NO;
        }
    }
    
    // If the rest of the word is the same after the added letter...
    if([self restOfWordIsSame:newWord onWord:currentWord fromIndex:indexOfNewChar withOffset:1]) {
        return YES;
    }

    return NO;
}
-(BOOL)isValidSub:(NSString *)newWord onWord:(NSString *)currentWord {
    // If the new word is not only one letter less than the current word...
    if (newWord.length != currentWord.length - 1) {
        // Cannot be valid subtraction
        return NO;
    }
    
    // A variable to store the original index of the character that has been deleted
    int indexOfDeletedChar = -1;
    // Cycles through the indexes of the current word
    for (int i = 0; i < newWord.length; i++) {
        // If the character in the new word at the current index is not equal to the
        // character in the current word at the current index...
        if ([newWord characterAtIndex: i] != [currentWord characterAtIndex: i]) {
            // Set the variable to the index
            indexOfDeletedChar = i;
            // Stop search
            break;
        }
    }
    // If the variable remains unchanged...
    if (indexOfDeletedChar == -1) {
        // The character must have been removed from the end of the current word.
        // Set the variable to the last index of the current word
        indexOfDeletedChar = (int)currentWord.length - 1;
    }
    // If the rest of the word is the same after the deleted character...
    if([self restOfWordIsSame:newWord onWord:currentWord fromIndex:indexOfDeletedChar-1 withOffset:-1]) {
        return YES;
    }
    return NO;
    
}
-(BOOL)isValidSwap:(NSString *)newWord onWord:(NSString *)currentWord {
    // If the new word and the current word do not have equal lengths...
    if (newWord.length != currentWord.length) {
        // Cannot be valid swap
        return NO;
    }
    // A variable to store the original index of the character that has been deleted
    int indexOfSwappedChar = -1;
    // Cycles through the indexes of the new word
    // (Both words have the same length, so it doesn't actually matter which one we cycle through)
    for (int i = 0; i < newWord.length; i++) {
        // If the character in the new word at the current index is not equal to the
        // character in the current word at the current index...
        if ([newWord characterAtIndex: i] != [currentWord characterAtIndex: i]) {
            // Set the variable to the index
            indexOfSwappedChar = i;
            // Stop the search
            break;
        }
    }
    // If the index variable was changed, and the rest of the word is the same after the swapped character...
    if(indexOfSwappedChar != -1 && [self restOfWordIsSame:newWord onWord:currentWord fromIndex:indexOfSwappedChar withOffset:0]) {
        return YES;
    }
    return NO;
}

// I'm not going to document this method yet because I'm probably going to change how it works                
-(BOOL)restOfWordIsSame:(NSString *)newWord onWord:(NSString *)currentWord fromIndex:(int)index withOffset:(int)offset {
    for (int i = index + 1; i < newWord.length; i++) {
        if ([newWord characterAtIndex: i] != [currentWord characterAtIndex: i - offset]) {
            return NO;
        }
    }
    return YES;
}


@end
