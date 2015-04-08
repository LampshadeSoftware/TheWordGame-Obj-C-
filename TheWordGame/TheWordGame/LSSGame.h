//
//  LSSGame.h
//  TheWordGame
//
//  Created by Daniel McCrystal on 4/5/15.
//  Copyright (c) 2015 Daniel McCrystal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSSGame : NSObject

@property (strong) NSString *currentWord;
@property (strong) NSString *logMessage;
@property (strong) NSMutableArray *usedWords;
@property int wordCount;

-(id)init:(NSString *)startWord;
-(id)init;
-(BOOL)isValidPlay:(NSString *)newWord onWord:(NSString *)currentWord;
-(BOOL)isValidAdd:(NSString *)newWord onWord:(NSString *)currentWord;
-(BOOL)isValidSub:(NSString *)newWord onWord:(NSString *)currentWord;
-(BOOL)isValidSwap:(NSString *)newWord onWord:(NSString *)currentWord;

+(void)initializeSaves;
+(NSMutableArray *)getSavedSinglePlayerFreePlayGames;

@end
