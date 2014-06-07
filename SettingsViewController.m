//
//  SettingsViewController.m
//  MPass
//
//  Created by Sebastian Demian on 6/4/14.
//  Copyright (c) 2014 Sebastian Demian. All rights reserved.
//

#import "SettingsViewController.h"
#import "GlobalVariables.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *licensePlate;
@property (weak, nonatomic) IBOutlet UITextField *lpState;
@property (weak, nonatomic) IBOutlet UILabel *currentUser;




@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)usernameDone:(id)sender {
    [sender resignFirstResponder];
}
- (IBAction)passwordDone:(id)sender {
    [sender resignFirstResponder];
}
- (IBAction)firstNameDone:(id)sender {
    [sender resignFirstResponder];
}
- (IBAction)lastNameDone:(id)sender {
    [sender resignFirstResponder];
}
- (IBAction)emailDone:(id)sender {
    [sender resignFirstResponder];
}
- (IBAction)licensePlateDone:(id)sender {
    [sender resignFirstResponder];
}
- (IBAction)lpStateDone:(id)sender {
    [sender resignFirstResponder];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    singleton = [GlobalVariables getSingleObject];
    _currentUser.text = [[singleton.users valueForKey: singleton.currentUser] objectAtIndex:1];
    
    //prepopulate fields
    _userName.text = singleton.currentUser;
    _firstName.text = [[singleton.users valueForKey: singleton.currentUser] objectAtIndex:1];
    _lastName.text = [[singleton.users valueForKey: singleton.currentUser] objectAtIndex:2];
    _email.text = [[singleton.users valueForKey: singleton.currentUser] objectAtIndex:3];
    _licensePlate.text = [[singleton.users valueForKey: singleton.currentUser] objectAtIndex:4];
    _lpState.text = [[singleton.users valueForKey: singleton.currentUser] objectAtIndex:5];
    
}
- (IBAction)bgTouch:(id)sender {
    [self.view endEditing:YES];
}


- (IBAction)Save:(UIButton *)sender {
    singleton.currentUser = _userName.text;

    if (![_password.text  isEqual: @""]){
        [[singleton.users valueForKey:singleton.currentUser] replaceObjectAtIndex:0 withObject:_password.text];
    }
    [[singleton.users valueForKey:singleton.currentUser] replaceObjectAtIndex:1 withObject:_firstName.text];
    [[singleton.users valueForKey:singleton.currentUser] replaceObjectAtIndex:2 withObject:_lastName.text];
    [[singleton.users valueForKey:singleton.currentUser] replaceObjectAtIndex:3 withObject:_email.text];
    [[singleton.users valueForKey:singleton.currentUser] replaceObjectAtIndex:4 withObject:_licensePlate.text];
    [[singleton.users valueForKey:singleton.currentUser] replaceObjectAtIndex:5 withObject:_lpState.text];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Settings Saved" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    
    NSLog(@"Modified record: %@", singleton.users);
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
