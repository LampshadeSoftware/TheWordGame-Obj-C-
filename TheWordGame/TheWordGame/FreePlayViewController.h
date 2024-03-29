//
//  FreePlayViewController.h
//  TheWordGame
//
//  Created by Daniel McCrystal on 4/4/15.
//  Copyright (c) 2015 Daniel McCrystal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FreePlayViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textBoxValue;
@property (weak, nonatomic) IBOutlet UILabel *currentWordValue;
@property (weak, nonatomic) IBOutlet UILabel *invalidWordLog;
@property (weak, nonatomic) IBOutlet UILabel *lastWord0;
@property (weak, nonatomic) IBOutlet UILabel *lastWord1;
@property (weak, nonatomic) IBOutlet UILabel *lastWord2;


@end
