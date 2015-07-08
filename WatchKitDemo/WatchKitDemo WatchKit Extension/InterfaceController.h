//
//  InterfaceController.h
//  WatchKitDemo WatchKit Extension
//
//  Created by Chris Beauchamp on 3/26/15.
//  Copyright (c) 2015 Crittercism. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface InterfaceController : WKInterfaceController

@property (weak, nonatomic) IBOutlet WKInterfaceMap *mapView;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *speedLabel;

- (IBAction)signalCrash;

@end
