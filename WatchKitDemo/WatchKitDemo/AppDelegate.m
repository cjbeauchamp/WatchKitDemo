//
//  AppDelegate.m
//  WatchKitDemo
//
//  Created by Chris Beauchamp on 3/25/15.
//  Copyright (c) 2015 Crittercism. All rights reserved.
//

#import "AppDelegate.h"

#import "Crittercism.h"

#import "ViewController.h"

@implementation AppDelegate

- (void) application:(UIApplication *)application
handleWatchKitExtensionRequest:(NSDictionary *)userInfo
               reply:(void (^)(NSDictionary *))reply
{
    ViewController *mainController = (ViewController*)  self.window.rootViewController;
    
    NSDictionary *serializedLocation = [mainController getSerializedLocation];
    
    reply(@{@"location": serializedLocation});
}
 
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    NSString *critterAppID = @"YOUR_APP_ID_GOES_HERE";
    
    NSAssert(![critterAppID isEqualToString:@"YOUR_APP_ID_GOES_HERE"], @"Enter your Crittercism App ID into the app delegate variable critterAppID!");
    
    [Crittercism enableWithAppID:critterAppID];

    return YES;
}

@end
