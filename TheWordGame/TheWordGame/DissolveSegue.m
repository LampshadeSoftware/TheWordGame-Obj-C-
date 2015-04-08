//
//  YAYSegue.m
//  Segue
//
//  Created by Cowboy Lynk on 6/14/14.
//  Copyright (c) 2015 Lampshade Software. All rights reserved.
//

#import "DissolveSegue.h"

@implementation DissolveSegue

- (void)perform
{
    UIViewController *sourceViewController = self.sourceViewController;
    UIViewController *destinationViewController = self.destinationViewController;
    
    [sourceViewController.view addSubview:destinationViewController.view];
    
    destinationViewController.view.alpha = 0.0;
    
    [UIView animateWithDuration:0.3
                          delay:0.5
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         
                         destinationViewController.view.alpha = 1.0;
                     }
                     completion:^(BOOL finished){
                         [destinationViewController.view removeFromSuperview];
                         [sourceViewController presentViewController:destinationViewController animated:NO completion:NULL];
                     }];
}

@end
