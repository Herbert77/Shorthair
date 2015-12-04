//
//  LoginViewController.m
//  Shorthair
//
//  Created by Herbert Hu on 15/12/1.
//  Copyright © 2015年 Herbert Hu. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *signInButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)signInButtonClicked:(UIButton *)sender {
    
    //TODO: 调用登录接口
    
}

- (IBAction)cancelButtonClicked:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
