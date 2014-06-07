//
//  PayModeViewController.m
//  MPass
//
//  Created by Sebastian Demian on 6/4/14.
//  Copyright (c) 2014 Sebastian Demian. All rights reserved.
//

#import "PayModeViewController.h"
#import "GlobalVariables.h"


@interface PayModeViewController ()
@property (weak, nonatomic) IBOutlet UITextField *plazaNumber;
@property (weak, nonatomic) IBOutlet UILabel *welcomeLabel;
@property (weak, nonatomic) IBOutlet UILabel *licensePlate;
@property (weak, nonatomic) IBOutlet UILabel *creditCard;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *time;



@end

@implementation PayModeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (IBAction)backgroundTap:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)logOut:(UIButton *)sender {
    singleton.currentUser = @"";
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    singleton = [GlobalVariables getSingleObject];
    
    _welcomeLabel.text = [[singleton.users valueForKey: singleton.currentUser] objectAtIndex:1];
    
    _licensePlate.text = [[singleton.users valueForKey: singleton.currentUser] objectAtIndex:4];

    _creditCard.text = [[[singleton.users valueForKey: singleton.currentUser] objectAtIndex:12] substringFromIndex:12];
    
    NSDate *currDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"dd/MM/YY"];
    NSString *date = [dateFormatter stringFromDate:currDate];
    _date.text = date;


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)payButton:(UIButton *)sender {
    if ([_plazaNumber.text isEqual: @""]){
        NSString * msg = @"Please enter a plaza number";
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Error"
                              message:msg
                              delegate:self
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];

    } else {
        NSMutableArray * finalResult = [[NSMutableArray alloc] init];
        [finalResult addObject: singleton.currentUser];
        NSArray * temp = [singleton.users valueForKey: singleton.currentUser];
        [finalResult addObjectsFromArray: temp];
        [finalResult addObject:_plazaNumber.text];
        [finalResult addObject:_date.text];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Payment sent" delegate:self cancelButtonTitle:@"Done" otherButtonTitles:nil, nil];
        [alert show];
        
        NSLog(@"Final Result: %@", finalResult);
        
        //CONSTRUCT THE HTTP POST MESSAGE
        
//        NSURL *aUrl = [NSURL URLWithString:@"http://www.illinoistollway.com/"];
//        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:aUrl
//                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
//                                                           timeoutInterval:60.0];
//        
//        NSURLConnection *connection= [[NSURLConnection alloc] initWithRequest:request
//                                                                     delegate:self];
//        
//        [request setHTTPMethod:@"POST"];
//        NSString *postString = @"parameters";
//        [request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)func:(UIButton *)sender {
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.distanceFilter = kCLDistanceFilterNone;
    _locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    [_locationManager startUpdatingLocation];
    
    [_MapView setMapType:MKMapTypeStandard];
    [_MapView setZoomEnabled:YES];
    [_MapView setScrollEnabled:YES];
    MKCoordinateRegion region = { {0.0, 0.0}, {0.0, 0.0} };
    region.center.latitude = _locationManager.location.coordinate.latitude;
    region.center.longitude = _locationManager.location.coordinate.longitude;
    region.span.longitudeDelta = 0.007f;
    region.span.latitudeDelta = 0.007f;
    
    [_MapView setRegion:region animated:YES];
    [_MapView setDelegate: sender];
    [_MapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
    
    
    
}
@end

















