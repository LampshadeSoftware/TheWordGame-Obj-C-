//
//  SinglePlayerGameModesViewController.h
//  TheWordGame
//
//  Created by Cowboy Lynk on 4/6/15.
//  Copyright (c) 2015 Daniel McCrystal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameModesViewController : UIViewController {
    
    IBOutlet UIImageView *freeplay;
    
    IBOutlet UIImageView *timetrial;
    
    IBOutlet UIImageView *levels;
}


-(IBAction)startFreeplay:(id)sender;

-(IBAction)startTimeTrial:(id)sender;

-(IBAction)startLevels:(id)sender;


@end
