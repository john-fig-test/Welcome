//
//  FIGSubmitViewController.m
//  Welcome
//
//  Created by John Figueiredo on 2/14/14.
//  Copyright (c) 2014 John Figueiredo. All rights reserved.
//

#import "FIGSubmitViewController.h"

@interface FIGSubmitViewController ()
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *badgeHeightConstraint;
@end

@implementation FIGSubmitViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self.firstNameTextField becomeFirstResponder];
  [self setBadgePlacement];
}

#pragma mark - IBActions
- (IBAction)submitButtonPressed:(id)sender {

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

@end
