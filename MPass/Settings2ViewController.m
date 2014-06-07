//
//  Settings2ViewController.m
//  MPass
//
//  Created by Sebastian Demian on 6/5/14.
//  Copyright (c) 2014 Sebastian Demian. All rights reserved.
//

#import "Settings2ViewController.h"
#import "GlobalVariables.h"

@interface Settings2ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *addr1;
@property (weak, nonatomic) IBOutlet UITextField *addr2;
@property (weak, nonatomic) IBOutlet UITextField *city;
@property (weak, nonatomic) IBOutlet UITextField *state;
@property (weak, nonatomic) IBOutlet UITextField *zip;
@property (weak, nonatomic) IBOutlet UITextField *cardType;
@property (weak, nonatomic) IBOutlet UITextField *cardNumber;
@property (weak, nonatomic) IBOutlet UITextField *cvvCode;
@property (weak, nonatomic) IBOutlet UITextField *expirationDate;
@property (weak, nonatomic) IBOutlet UILabel *currentUser;



@end

@implementation Settings2ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)addr1Done:(id)sender {
    [sender resignFirstResponder];
}
- (IBAction)addr2Done:(id)sender {
    [sender resignFirstResponder];
}
- (IBAction)cityDone:(id)sender {
    [sender resignFirstResponder];
}
- (IBAction)stateDone:(id)sender {
    [sender resignFirstResponder];
}
- (IBAction)zipDone:(id)sender {
    [sender resignFirstResponder];
}
- (IBAction)cardTypeDone:(id)sender {
    [sender resignFirstResponder];
}
- (IBAction)cardNumberDone:(id)sender {
    [sender resignFirstResponder];
}
- (IBAction)cvvDone:(id)sender {
    [sender resignFirstResponder];
}
- (IBAction)expDone:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)save:(UIButton *)sender {
    
    [[singleton.users valueForKey:singleton.currentUser] replaceObjectAtIndex:6 withObject:_addr1.text];
    [[singleton.users valueForKey:singleton.currentUser] replaceObjectAtIndex:7 withObject:_addr2.text];
    [[singleton.users valueForKey:singleton.currentUser] replaceObjectAtIndex:8 withObject:_city.text];
    [[singleton.users valueForKey:singleton.currentUser] replaceObjectAtIndex:9 withObject:_state.text];
    [[singleton.users valueForKey:singleton.currentUser] replaceObjectAtIndex:10 withObject:_zip.text];
    [[singleton.users valueForKey:singleton.currentUser] replaceObjectAtIndex:11 withObject:_cardType.text];
    [[singleton.users valueForKey:singleton.currentUser] replaceObjectAtIndex:12
        withObject:_cardNumber.text];
    [[singleton.users valueForKey:singleton.currentUser] replaceObjectAtIndex:13
        withObject:_cvvCode.text];
    [[singleton.users valueForKey:singleton.currentUser] replaceObjectAtIndex:14
        withObject:_expirationDate.text];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Settings Saved" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    
    
    NSLog(@"Modified record: %@", singleton.users);
}

- (IBAction)bgTouch:(id)sender {
    [self.view endEditing:YES];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    singleton = [GlobalVariables getSingleObject];
    _currentUser.text = [[singleton.users valueForKey: singleton.currentUser] objectAtIndex:1];
    
    //prepopulate fields
    _addr1.text = [[singleton.users valueForKey: singleton.currentUser] objectAtIndex:6];
    _addr2.text = [[singleton.users valueForKey: singleton.currentUser] objectAtIndex:7];
    _city.text = [[singleton.users valueForKey: singleton.currentUser] objectAtIndex:8];
    _state.text = [[singleton.users valueForKey: singleton.currentUser] objectAtIndex:9];
    _zip.text = [[singleton.users valueForKey: singleton.currentUser] objectAtIndex:10];
    _cardType.text = [[singleton.users valueForKey: singleton.currentUser] objectAtIndex:11];
    _cardNumber.text = [[singleton.users valueForKey: singleton.currentUser] objectAtIndex:12];
    _cvvCode.text = [[singleton.users valueForKey: singleton.currentUser] objectAtIndex:13];
    _expirationDate.text = [[singleton.users valueForKey: singleton.currentUser] objectAtIndex:14];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

@end
