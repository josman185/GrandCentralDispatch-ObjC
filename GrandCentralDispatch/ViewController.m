//
//  ViewController.m
//  GrandCentralDispatch
//
//  Created by MCS on 3/16/16.
//  Copyright © 2016 MCS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize progressBar,otherProgressBar;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// Start a loop and Update the first progress bar
- (IBAction)startProgress:(id)sender
{
    dispatch_async(dispatch_queue_create("newQueue", NULL), ^{
        for (int i=15000; i<=25000; i++)
        {
            NSLog(@"The number#2 is %d",i);
            
            if ((i-15000)%100 == 0)
            {
                float f = (float)(i-15000)/10000;
                
                //Update the progress bar in the main queue
                //(the main process)
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.progressBar setProgress:f animated:YES];
                });
            }
        }
        
    });
}

- (IBAction)startOtherProgress:(id)sender
{
    dispatch_async(dispatch_queue_create("newestQueue", NULL), ^{
        for (int i=5000; i<=15000; i++)
        {
            NSLog(@"The number#1 is %d",i);
            
            if ((i-5000)%100 == 0)
            {
                float f = (float)(i-5000)/10000;
                
                //Update the progress bar in the main queue
                //(the main process)
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.otherProgressBar setProgress:f animated:YES];
                });
            }
        }
        
    });
    
}
@end
