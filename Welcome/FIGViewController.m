//
//  FIGViewController.m
//  Welcome
//
//  Created by John Figueiredo on 2/14/14.
//  Copyright (c) 2014 John Figueiredo. All rights reserved.
//

#import "FIGViewController.h"
#import "FIGSubmitViewController.h"

@interface FIGViewController ()
@property (weak, nonatomic) IBOutlet UILabel *welcomeLabel;
@end

@implementation FIGViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setWelcomeLabelText:) name:kFIGWelcomeLabelSet object:nil];
}

#pragma mark - IBActions
- (IBAction)unwindToFIG:(UIStoryboardSegue *)unwindSegue {
}

- (void)populateWelcomeLabelWithFirstName:(NSString*)firstName andLastName:(NSString*)lastName {
  NSString *welcomeLabelText = [NSString stringWithFormat:@"Welcome to the party %@ %@!", firstName, lastName];
  self.welcomeLabel.text = welcomeLabelText;
}

#pragma mark - Private Methods
- (void)setWelcomeLabelText:(NSNotification *)notification {
  NSDictionary *userName = [notification userInfo];
  NSString *firstName = userName[@"firstName"];
  NSString *lastName = userName[@"lastName"];
  
//  STRIP WHITESPACE BEFORE SETTING LABEL
  
  NSString *fullName = [NSString stringWithFormat:@"%@ %@", firstName, lastName];
  NSString *welcomeLabelText = [NSString stringWithFormat:@"Welcome to the party %@!", fullName];
  self.welcomeLabel.text = welcomeLabelText;
}

@end