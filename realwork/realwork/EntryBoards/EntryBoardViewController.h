//
//  EntryBoardViewController.h
//  realwork
//
//  Created by Nathan Ngobale on 2020/03/26.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <NLibrary/LoginViewControllerProtocol.h>
#import <NLibrary/LoginViewModel.h>
#import <NLibrary/LoginRepo.h>
NS_ASSUME_NONNULL_BEGIN

@interface EntryBoardViewController : UIViewController<LoginViewControllerProtocol>
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

- (void)successfulSignIn;
- (void)unsuccessfulSignIn: (NSString* ) message;
@end

NS_ASSUME_NONNULL_END
