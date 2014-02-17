//
//  FIGViewController.m
//  Welcome
//
//  Created by John Figueiredo on 2/14/14.
//  Copyright (c) 2014 John Figueiredo. All rights reserved.
//

#import "FIGViewController.h"
#import "FIGSubmitViewController.h"

NSUInteger welcomeNumber = 0;

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
  NSArray *welcomeResponseArray = @[@"Welcome to the party %@!", @"You're a coding machine %@!", @"Welcome to the Matrix %@!"];
  
//  NSArray Setting
  if (welcomeNumber == [welcomeResponseArray count])
    welcomeNumber = 0;
  
// Parsing userInfo from NSNotificationCenter
  NSDictionary *userName = [notification userInfo];
  NSString *firstName = userName[@"firstName"];
  NSString *lastName = userName[@"lastName"];
  
// Setting UILabel and trimming whitespace
  NSString *fullName = [NSString stringWithFormat:@"%@ %@", firstName, lastName];
  NSString *trimmedFullName = [fullName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
  NSString *welcomeLabelText = [NSString stringWithFormat:welcomeResponseArray[welcomeNumber], trimmedFullName];
  self.welcomeLabel.text = welcomeLabelText;
  welcomeNumber += 1;
}

@end