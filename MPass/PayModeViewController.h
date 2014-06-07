//
//  PayModeViewController.h
//  MPass
//
//  Created by Sebastian Demian on 6/4/14.
//  Copyright (c) 2014 Sebastian Demian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "GlobalVariables.h"

@interface PayModeViewController : UIViewController {
    GlobalVariables * singleton;
}



@property (weak, nonatomic) IBOutlet MKMapView *MapView;
- (IBAction)func:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet CLLocationManager *locationManager;

@end
