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
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end