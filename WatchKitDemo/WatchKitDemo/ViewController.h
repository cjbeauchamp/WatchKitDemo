//
//  ViewController.h
//  WatchKitDemo
//
//  Created by Chris Beauchamp on 3/25/15.
//  Copyright (c) 2015 Crittercism. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// Our status labels
@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *altitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *speedLabel;

// The location tracking start/stop button
@property (weak, nonatomic) IBOutlet UIButton *trackLocationButton;
- (IBAction)toggleLocationTracking:(id)sender;

@end

