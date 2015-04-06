//
//  LandingPageViewController.h
//  TheWordGame
//
//  Created by Cowboy Lynk on 4/6/15.
//  Copyright (c) 2015 Daniel McCrystal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LandingPageViewController : UIViewController {
    
    IBOutlet UIImageView *singleplayer;
    
    IBOutlet UIImageView *multiplayer;
    
}


-(IBAction)startSinglePlayer:(id)sender;

-(IBAction)startMultiPlayer:(id)sender;

@end
