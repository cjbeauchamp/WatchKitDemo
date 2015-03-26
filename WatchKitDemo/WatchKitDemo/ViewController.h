//
//  ViewController.h
//  WatchKitDemo
//
//  Created by Chris Beauchamp on 3/25/15.
//  Copyright (c) 2015 Crittercism. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *trackLocationButton;

@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *altitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *speedLabel;

- (IBAction)toggleLocationTracking:(id)sender;

@end

