//
//  main.m
//  TheWordGame
//
//  Created by Daniel McCrystal on 4/1/15.
//  Copyright (c) 2015 Daniel McCrystal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "LSSDictionary.h"
#import "LSSGame.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        [LSSDictionary initialize];
        [LSSGame initializeSaves];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
