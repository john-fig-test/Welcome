//
//  FIGSubmitViewController.m
//  Welcome
//
//  Created by John Figueiredo on 2/14/14.
//  Copyright (c) 2014 John Figueiredo. All rights reserved.
//

#import "FIGSubmitViewController.h"
#import "FIGViewController.h"

@interface FIGSubmitViewController ()
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *badgeHeightConstraint;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@end

@implementation FIGSubmitViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self.firstNameTextField becomeFirstResponder];
  [self setBadgePlacement];
}

#pragma mark - IBActions
- (IBAction)submitButtonPressed:(id)sender {
  [self sendFullNameInformation];
}

#pragma mark - Textfield Changing
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  if (textField == self.firstNameTextField) {
    [self.lastNameTextField becomeFirstResponder];
  } else if (textField == self.lastNameTextField) {
    [self sendFullNameInformation];
    [self performSegueWithIdentifier:@"unwindToStartViewController" sender:nil];
  }
  return YES;
}

#pragma mark - Private Methods
- (void)setBadgePlacement {
  CGSize screenSize = [[UIScreen mainScreen] bounds].size;
  
  if (screenSize.height > 480.0f) {
    self.badgeHeightConstraint.constant = 50.f;
  } else {
    self.badgeHeightConstraint.constant = 10.f;
  }
}

- (void)sendFullNameInformation {
  NSString *firstName = self.firstNameTextField.text;
  NSString *lastName = self.lastNameTextField.text;
  NSDictionary *userName = [[NSDictionary alloc] initWithObjectsAndKeys:firstName, @"firstName", lastName, @"lastName", nil];
  [[NSNotificationCenter defaultCenter] postNotificationName:kFIGWelcomeLabelSet object:nil userInfo:userName];
}

@end
