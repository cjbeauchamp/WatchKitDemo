//
//  ViewController.m
//  WatchKitDemo
//
//  Created by Chris Beauchamp on 3/25/15.
//  Copyright (c) 2015 Crittercism. All rights reserved.
//

#import "ViewController.h"

#import <CoreLocation/CoreLocation.h> 

@interface ViewController ()

// make sure we conform to the location delegate
<CLLocationManagerDelegate>

// if we are currently tracking location
@property (nonatomic, assign) BOOL tracking;

// our location manager
@property (nonatomic, strong) CLLocationManager *locationManager;

@end

@implementation ViewController

#pragma mark - Setters

// we override the setter here to make it easier to align our variable w/
// our button status
- (void) setTracking:(BOOL)tracking
{
    _tracking = tracking;
    
    NSString *title = _tracking ? @"Stop Tracking Location" : @"Start Tracking Location";
    [_trackLocationButton setTitle:title forState:UIControlStateNormal];
}

#pragma mark - View Methods

- (void)viewDidLoad {
    [super viewDidLoad];

    // set up our persistent location manager
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
}

#pragma mark - Location Delegates

- (void) locationManager:(CLLocationManager *)manager
        didFailWithError:(NSError *)error
{
    NSLog(@"Error retrieving location: %@", error);
}

- (void) locationManager:(CLLocationManager*)manager
     didUpdateToLocation:(CLLocation*)newLocation
            fromLocation:(CLLocation*)oldLocation
{
    // update our location
    NSLog(@"New location: %@", newLocation);
    
    // update our labels
    _latitudeLabel.text = [NSString stringWithFormat:@"%g", newLocation.coordinate.latitude];
    _longitudeLabel.text = [NSString stringWithFormat:@"%g", newLocation.coordinate.longitude];
    _altitudeLabel.text = [NSString stringWithFormat:@"%g", newLocation.altitude];
    _speedLabel.text = [NSString stringWithFormat:@"%g", newLocation.speed];
}


- (void) locationManager:(CLLocationManager *)manager
didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    NSLog(@"Location authorization status changed: %d", status);

    // if we are not authorized, stop tracking (in case we were)
    if(status < kCLAuthorizationStatusAuthorizedAlways) {
        self.tracking = FALSE;
        [_locationManager stopUpdatingLocation];
    }
    
    // we are authorized, go ahead and start tracking
    else {
        self.tracking = TRUE;
        [_locationManager startUpdatingLocation];
    }
}

# pragma mark - Interface Actions

- (IBAction)toggleLocationTracking:(id)sender {
    
    // check to see if we have access yet
    if([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
        
        // we don't, so ask the user for it
        if([_locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
            [_locationManager requestAlwaysAuthorization];
        }
        
        // (same thing as the if-statement, just geared toward different API versions)
        else {
            self.tracking = TRUE;
            [_locationManager startUpdatingLocation];
        }
    }
    
    // the user denied it or shut it off via settings
    else if([CLLocationManager authorizationStatus] < kCLAuthorizationStatusAuthorizedAlways) {
        
        // tell the user to go to settings
        NSString *msg = @"Location access is not available. Ensure your Location Services are on and go to your iPhone Settings > Privacy > Location Services and find this app. Make sure the 'Allow Location Access' is set to 'Always'";
        [[[UIAlertView alloc] initWithTitle:@"Error"
                                    message:msg
                                   delegate:nil
                          cancelButtonTitle:@"Okay"
                          otherButtonTitles:nil] show];
    }
    
    // we have access, fire it
    else {
        
        // if we're already tracking, shut it down
        if(self.tracking) {
            [_locationManager stopUpdatingLocation];
        }
        
        // otherwise, turn it on
        else {
            [_locationManager startUpdatingLocation];
        }
        
        // toggle our variable to keep track
        self.tracking = !self.tracking;
    }
    
}

@end
