//
//  EntryBoardViewController.m
//  realwork
//
//  Created by Nathan Ngobale on 2020/03/26.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

#import "EntryBoardViewController.h"

@interface EntryBoardViewController ()

@end



@implementation EntryBoardViewController

// TODO Should I synthesize textField elements
@synthesize viewModelDelegate;
- (IBAction)loginButtonAction:(id)sender {
    [self.viewModelDelegate signIn:(self.emailTextField.text)
                                  :(self.passwordTextField.text)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.delegate = [[LoginViewModel alloc] init];
    LoginViewModel *viewModel = [[LoginViewModel alloc] init];
    self.viewModelDelegate = viewModel;             // Some reason this gets undone when it is a weak reference
}

- (void)signin:(NSString *)email :(NSString *)password { 
    
}

- (void)successfulSignIn {
//    [alert release];
}

- (void)unsuccessfulSignIn { 
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"My Alert"
                                   message:@"This is an alert."
                                   preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
       handler:^(UIAlertAction * action) {}];

    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}
@end
