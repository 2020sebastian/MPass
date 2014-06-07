//
//  Registration2ViewController.m
//  MPass
//
//  Created by Sebastian Demian on 6/5/14.
//  Copyright (c) 2014 Sebastian Demian. All rights reserved.
//

#import "Registration2ViewController.h"
#import "GlobalVariables.h"

@interface Registration2ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *address1;
@property (weak, nonatomic) IBOutlet UITextField *address2;
@property (weak, nonatomic) IBOutlet UITextField *city;
@property (weak, nonatomic) IBOutlet UITextField *state;
@property (weak, nonatomic) IBOutlet UITextField *zip;
@property (weak, nonatomic) IBOutlet UITextField *cardType;
@property (weak, nonatomic) IBOutlet UITextField *cardNumber;
@property (weak, nonatomic) IBOutlet UITextField *cvv;
@property (weak, nonatomic) IBOutlet UITextField *expDate;



@end

@implementation Registration2ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)finish:(UIButton *)sender {
    //check for empty
    if ([_address1.text  isEqual: @""] ||
        [_address2.text  isEqual: @""] ||
        [_city.text  isEqual: @""] ||
        [_state.text  isEqual: @""] ||
        [_zip.text  isEqual: @""] ||
        [_zip.text length] < 5 ||
        [_cardNumber.text  isEqual: @""] ||
        [_cardNumber.text length] < 16 ||
        [_cvv.text  isEqual: @""] ||
        [_cvv.text length] < 3 ||
        [_expDate.text  isEqual: @""]){
        
        NSString * msg = @"Please complete all fields before proceeding";
                          UIAlertView *alert = [[UIAlertView alloc]
                                                initWithTitle:@"Error"
                                                message:msg
                                                delegate:self
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
                          [alert show];
                          
                          } else {

    
    NSArray * temp = @[_address1.text, _address2.text, _city.text, _state.text, _zip.text,
                       _cardType.text, _cardNumber.text, _cvv.text, _expDate.text];
    
    [singleton.tempRegistrationInfo addObjectsFromArray:temp];
    
    //add all information to a single array
    [singleton.tempRegistrationInfo arrayByAddingObjectsFromArray:temp];
    
    //insert the new user in the dictionary and log user into the system
    
    singleton.currentUser = [singleton.tempRegistrationInfo objectAtIndex:0];
    //remove username from the values list of the array
    [singleton.tempRegistrationInfo removeObjectAtIndex:0];
    
    [singleton.users setObject: singleton.tempRegistrationInfo forKey: singleton.currentUser];
                              
                              NSString * msg = [@"Welcome " stringByAppendingString: [[singleton.users valueForKey: singleton.currentUser] objectAtIndex:1]];
                              UIAlertView *alert = [[UIAlertView alloc]
                                                    initWithTitle:@"Good Job !"
                                                    message:msg
                                                    delegate:self
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil];
                              [alert show];
                              
                              
                              
                              
     UIStoryboard * mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
     UIViewController * vc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"PayMode"];
    
     [self presentViewController:vc animated:YES completion:nil];
                              
    
    NSLog(@"Inserted %@ into the dictionary with values %@", singleton.currentUser, [singleton.users valueForKey:singleton.currentUser]);
                              
        
                              
    }
}

- (IBAction)backgroundTap:(id)sender {
    [self.view endEditing:YES];
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
- (IBAction)typeDone:(id)sender {
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
