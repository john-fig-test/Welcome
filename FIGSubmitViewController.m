//
//  FIGSubmitViewController.m
//  Welcome
//
//  Created by John Figueiredo on 2/14/14.
//  Copyright (c) 2014 John Figueiredo. All rights reserved.
//

#import "FIGSubmitViewController.h"

@interface FIGSubmitViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@end

@implementation FIGSubmitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.nameTextField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
