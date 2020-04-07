//
//  EntryBoardViewController.m
//  realwork
//
//  Created by Nathan Ngobale on 2020/03/26.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

#import "EntryBoardViewController.h"
//#import <NLibrary/NLibrary-Swift.h>
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
    LoginRepo* repo = [[LoginRepo alloc] init];
    LoginViewModel *viewModel = [[LoginViewModel alloc] initWithrepo: repo viewController: self ];
    self.viewModelDelegate = viewModel;             // Some reason this gets undone when it is a weak reference
    
}

- (void)successfulSignIn {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"DashboardTab" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"DashboardTabID"];
    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:vc animated:YES completion:NULL];
}

- (void)unsuccessfulSignIn:(NSString *)message {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Opps Unsuccessful Login"
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

// let alertController = UIAlertController(title: title, message:
//    message, preferredStyle: .alert)
// alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
// self.present(alertController, animated: true, completion: nil)
@end
