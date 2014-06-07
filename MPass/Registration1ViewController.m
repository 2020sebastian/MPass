//
//  Registration1ViewController.m
//  MPass
//
//  Created by Sebastian Demian on 6/5/14.
//  Copyright (c) 2014 Sebastian Demian. All rights reserved.
//

#import "Registration1ViewController.h"
#import "GlobalVariables.h"

@interface Registration1ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;

@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *licensePlate;
@property (weak, nonatomic) IBOutlet UITextField *lpState;


@end

@implementation Registration1ViewController

- (IBAction)next:(UIButton *)sender {
    
    //check for empty
    if ([_userName.text  isEqual: @""] ||
        [_password.text  isEqual: @""] ||
        [_firstName.text  isEqual: @""] ||
        [_lastName.text  isEqual: @""] ||
        [_email.text  isEqual: @""] ||
        //email does not contain @ character
        [_email.text rangeOfString:@"@"].location == NSNotFound  ||
        [_licensePlate.text  isEqual: @""] ||
        [_lpState.text  isEqual: @""]){
        NSString * msg = @"Please complete all fields before proceeding";
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Error"
                              message:msg
                              delegate:self
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
        
    } else {
    
    NSArray * temp = @[_userName.text, _password.text, _firstName.text,
        _lastName.text, _email.text, _licensePlate.text,
        _lpState.text];
    
    singleton.tempRegistrationInfo  = [[NSMutableArray alloc] init];
    [singleton.tempRegistrationInfo addObjectsFromArray:temp];
        
        UIStoryboard * mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController * vc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"Registration2ViewController"];
        [self presentViewController:vc animated:YES completion:nil];
    }
}


- (IBAction)userNameDone:(id)sender {
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


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    singleton = [GlobalVariables getSingleObject];
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
