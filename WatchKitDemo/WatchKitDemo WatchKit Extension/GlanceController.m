//
//  GlanceController.m
//  WatchKitDemo WatchKit Extension
//
//  Created by Chris Beauchamp on 3/26/15.
//  Copyright (c) 2015 Crittercism. All rights reserved.
//

#import "GlanceController.h"

#import "Crittercism.h"

@interface GlanceController(){
    NSTimer *_updateTimer;
}

@end

@implementation GlanceController

- (void) requestSpeedFromPhone
{

}

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
}

- (void)willActivate {
    
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    _updateTimer = [NSTimer scheduledTimerWithTimeInterval:1.f
                                                    target:self
                                                  selector:@selector(requestSpeedFromPhone)
                                                  userInfo:nil
                                                   repeats:TRUE];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
    
    [_updateTimer invalidate];
}

@end



