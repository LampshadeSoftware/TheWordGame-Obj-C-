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
    NSLog(dictionary[10]);
}

+(BOOL)isEnglishWord:(NSString *)word {
    for(NSString *word in dictionary) {
        if([word isEqualToString:word]) {
            return YES;
        }
    }
    return NO;
}

@end
