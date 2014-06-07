//
//  HomeViewController.m
//  MPass
//
//  Created by Sebastian Demian on 6/4/14.
//  Copyright (c) 2014 Sebastian Demian. All rights reserved.
//

#import "HomeViewController.h"
#import "GlobalVariables.h"


@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;


@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (IBAction)pinched:(UIGestureRecognizer*)sender {
    singleton.currentUser = @"";
    exit(0);
}
- (IBAction)rotation:(UIGestureRecognizer*)sender {
    UIStoryboard * mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController * vc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"PayMode"];
    singleton.currentUser = @"user1";
    [self presentViewController:vc animated:YES completion:nil];
    
}


- (IBAction)usernameEditDone:(UITextField *)sender {
    [sender resignFirstResponder];
}
- (IBAction)passwordEditDone:(UITextField *)sender {
    [sender resignFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    singleton = [GlobalVariables getSingleObject];
    
    //if this is the first time it loads
    if (!singleton.users){
    singleton.users = [[NSMutableDictionary alloc] init];

    //load sample test user
    singleton.currentUser = @"";
    
        NSArray * userDetails = [NSArray arrayWithObjects:@"pass",@"John", @"Doe", @"john.doe@gmail.com", @"K500203", @"IL",
                             @"1 W. Madison st", @"Apt 203", @"Chicago", @"IL", @"60601", @"Visa", @"4562200312566356", @"255", @"02/15", nil];
    
        NSMutableArray * temp = [[NSMutableArray alloc] init];
        [temp addObjectsFromArray:userDetails];
        
    [singleton.users setValue: temp forKey: @"user1"];
    }
    NSLog(@"Current users: %@", singleton.users);
}

- (IBAction)logIn:(UIButton *)sender {

    UIStoryboard * mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController * vc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"PayMode"];
 
    //check if username is in the users singleton dict
    if ([[singleton.users allKeys] containsObject:_userName.text]) {
        singleton.currentUser = _userName.text; //set the logged in user
        
        //check password
        if ([_password.text isEqualToString: [[singleton.users valueForKey: singleton.currentUser] objectAtIndex:0]]) {
            
            //log user in
            [self presentViewController:vc animated:YES completion:nil];
            NSString * msg = [@"Welcome " stringByAppendingString: _userName.text];
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"Logged in"
                                  message:msg
                                  delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
            [alert show];
        
        } else {
     
            NSString * msg = [@"Incorrect Password for " stringByAppendingString: _userName.text];
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"Error"
                                  message:msg
                                  delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
            [alert show];
        }
    }
    else {
        
        NSString * msg = [_userName.text stringByAppendingString: @" doesn't exist in the database. Please register."];
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Error"
                              message:msg
                              delegate:self
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
        
    }
    
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
