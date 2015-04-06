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

static NSMutableArray *savedGames;

+(void)initializeSaves {
    savedGames = [[NSMutableArray alloc] init];
    NSLog(@"Game saves initialized");
}

+(NSMutableArray *)getSavedGames {
    return savedGames;
}

-(id)init:(NSString *)startWord {
    self = [super init];
    _currentWord = startWord;
    _usedWords = [NSMutableArray arrayWithObjects:@"", @"", @"", _currentWord, nil];
    _logMessage = @"";
    
    NSLog(@"Created new game");
    return self;
}

- (id) init {
    self = [super init];
    _currentWord = [LSSDictionary getRandomWord];
    _usedWords = [NSMutableArray arrayWithObjects:@"", @"", @"", _currentWord, nil];
    _logMessage = @"";
    
    NSLog(@"Created new game");
    return self;
}

-(void)updateMessage:(NSString *)message {
    _logMessage = message;
}

-(BOOL)isValidPlay:(NSString *)newWord onWord:(NSString *)currentWord {
    [self updateMessage:@"Invalid play!"];
    
    if([newWord isEqualToString: @""]) {
        [self updateMessage:@"You didn't type anything."];
        return NO;
    }
    
    if([newWord isEqualToString:@"fjord"]) {
        [self updateMessage:@"You know goddamn well what you did."];
        return NO;
    }
    
    for(NSString *word in _usedWords) {
        if([word isEqualToString: newWord]) {
            [self updateMessage:[NSString stringWithFormat:@"%@ has already been played.", word]];
            return NO;
        }
    }
    
    if([self isValidAdd:newWord onWord:currentWord] || [self isValidSub:newWord onWord:currentWord] || [self isValidSwap:newWord onWord:currentWord]) {
        if([LSSDictionary isEnglishWord:newWord]) {
            NSString *lastWord = _usedWords[[_usedWords count] -2];
            if([self isValidAdd:newWord onWord:lastWord] || [self isValidSub:newWord onWord:lastWord] || [self isValidSwap:newWord onWord:lastWord]) {
                [self updateMessage:@"Double play!"];
                return NO;
            }
            return YES;
        }
        else {
            [self updateMessage:[NSString stringWithFormat:@"%@ is not an English word.", newWord]];
        }
    }
    return NO;
}
-(BOOL)isValidAdd:(NSString *)newWord onWord:(NSString *)currentWord {
    if(newWord.length != currentWord.length + 1) {
        return NO;
    }
    
    int indexOfNewChar = -1;
    for (int i = 0; i < currentWord.length; i++) {
        
        if ([newWord characterAtIndex: i] != [currentWord characterAtIndex: i]) {
            indexOfNewChar = i;
            break;
        }
    }
    if (indexOfNewChar == -1) {
        indexOfNewChar = (int)newWord.length - 1;
        
        if([newWord characterAtIndex: indexOfNewChar] == 's') {
            [self updateMessage:@"Cannot simply add 's'"];
            return NO;
        }
        if([newWord characterAtIndex: indexOfNewChar - 1] == 'e' && [newWord characterAtIndex: indexOfNewChar] == 'd') {
            [self updateMessage:@"Cannot simply make verb past tense."];
            return NO;
        }
    }
    
    if([self restOfWordIsSame:newWord onWord:currentWord fromIndex:indexOfNewChar withOffset:1]) {
        return YES;
    }

    return NO;
}
-(BOOL)isValidSub:(NSString *)newWord onWord:(NSString *)currentWord {
    if (newWord.length != currentWord.length - 1) {
        return NO;
    }
    
    int indexOfDeletedChar = -1;
    for (int i = 0; i < newWord.length; i++) {
        if ([newWord characterAtIndex: i] != [currentWord characterAtIndex: i]) {
            indexOfDeletedChar = i;
            break;
        }
    }
    if (indexOfDeletedChar == -1) {
        indexOfDeletedChar = (int)currentWord.length - 1;
    }
    if([self restOfWordIsSame:newWord onWord:currentWord fromIndex:indexOfDeletedChar-1 withOffset:-1]) {
        return YES;
    }
    return NO;
    
}
-(BOOL)isValidSwap:(NSString *)newWord onWord:(NSString *)currentWord {
    if (newWord.length != currentWord.length) {
        return NO;
    }
    int indexOfSwappedChar = -1;
    for (int i = 0; i < newWord.length; i++) {
        if ([newWord characterAtIndex: i] != [currentWord characterAtIndex: i]) {
            indexOfSwappedChar = i;
            break;
        }
    }
    if(indexOfSwappedChar != -1 && [self restOfWordIsSame:newWord onWord:currentWord fromIndex:indexOfSwappedChar withOffset:0]) {
        return YES;
    }
    return NO;
}
                
-(BOOL)restOfWordIsSame:(NSString *)newWord onWord:(NSString *)currentWord fromIndex:(int)index withOffset:(int)offset {
    for (int i = index + 1; i < newWord.length; i++) {
        if ([newWord characterAtIndex: i] != [currentWord characterAtIndex: i - offset]) {
            return NO;
        }
    }
    return YES;
}


@end
