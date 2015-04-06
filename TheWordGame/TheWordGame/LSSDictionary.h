//
//  LSSDictionary.h
//  TheWordGame
//
//  Created by Daniel McCrystal on 4/5/15.
//  Copyright (c) 2015 Daniel McCrystal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSSDictionary : NSObject

+(void)initialize;
+(BOOL)isEnglishWord:(NSString *)newWord;

@end
