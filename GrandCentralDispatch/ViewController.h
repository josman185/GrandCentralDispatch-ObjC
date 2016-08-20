//
//  ViewController.h
//  GrandCentralDispatch
//
//  Created by MCS on 3/16/16.
//  Copyright © 2016 MCS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIProgressView *progressBar;
@property (strong, nonatomic) IBOutlet UIProgressView *otherProgressBar;

- (IBAction)startProgress:(id)sender;
- (IBAction)startOtherProgress:(id)sender;

@end

