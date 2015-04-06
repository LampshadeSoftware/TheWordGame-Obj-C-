//
//  LSSDictionary.m
//  TheWordGame
//
//  Created by Daniel McCrystal on 4/5/15.
//  Copyright (c) 2015 Daniel McCrystal. All rights reserved.
//

#import "LSSDictionary.h"

@implementation LSSDictionary

static NSArray *dictionary;

+(void) initialize {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Dictionary" ofType:@"txt"];
    NSString *entireDictionary = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    dictionary = [entireDictionary componentsSeparatedByString:@"\n"];
    NSLog(@"Dictionary initialized");
}

+(BOOL)isEnglishWord:(NSString *)newWord {
    for(NSString *word in dictionary) {
        if([newWord isEqualToString:word]) {
            return YES;
        }
    }
    return NO;
}

+(NSString *)getRandomWord {
    int start = arc4random_uniform((int)[dictionary count]);
    for(int i=start; i<(int)[dictionary count]; i++) {
        NSString *potential = dictionary[i];
        if (potential.length == 4 || potential.length == 5) {
            return potential;
        }
    }
    return @"word";
}

@end