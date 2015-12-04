//
//  HHBaseViewController.m
//  Shorthair
//
//  Created by Herbert Hu on 15/11/30.
//  Copyright © 2015年 Herbert Hu. All rights reserved.
//

#import "HHBaseViewController.h"
#import "HHNavigationController.h"
#import "LoginViewController.h"

@interface HHBaseViewController ()

@end

@implementation HHBaseViewController

#pragma mark - Life Cycle

- (instancetype)init {
    
    self = [super init];
    if (!self) {
        return nil;
    }
    /**< 在初始化方法中创建 菜单按钮的原因：
     
     菜单按钮的状态在初始化时，默认为 LBHamburgerButtonStateHamburger
     问题：当使用菜单，在不同的视图控制器之间跳转时，发现bug（跳转到的控制器的菜单按钮没有动画）
     原因：跳转到的控制器的菜单按钮的 state 起始为 LBHamburgerButtonStateHamburger
     无法完成状态的转换，也就没有动画的产生。
     解决：
     1.在视图控制器初始化的时候，就创建菜单按钮，以便在后续的方法中修改 state 的起始值为 LBHamburgerButtonStateNotHamburger，该修改位于 HHNavigationController类->initAllViewControllers方法中。
     */
    _hamburgerButton = [[LBHamburgerButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)
                                              withHamburgerType:LBHamburgerButtonTypeCloseButton
                                                      lineWidth:26
                                                     lineHeight:18/6.0
                                                    lineSpacing:4
                                                     lineCenter:CGPointMake(20, 20)
                                                          color:[UIColor whiteColor]];
    
    [_hamburgerButton setHamburgerAnimationDuration:0.4f];
    
    [_hamburgerButton setBackgroundColor:[UIColor clearColor]];
    [_hamburgerButton addTarget:self.navigationController action:@selector(showMenu) forControlEvents:UIControlEventTouchUpInside];
    
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationItem setTitle:@"Shorthair"];
    [self navigationItem].leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_hamburgerButton];
    
    UIButton *rightUserButton = [[UIButton alloc] init];
    [rightUserButton setFrame:CGRectMake(0, 0, 35, 35)];
    [rightUserButton setImage:[UIImage imageNamed:@"icon_User"] forState:UIControlStateNormal];
    [rightUserButton addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    [self navigationItem].rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightUserButton];
}

#pragma mark - Action

- (void)login:(id)sender {
    
    LoginViewController *loginVC = [LoginViewController new];
    [self presentViewController:loginVC animated:YES completion:nil];
}


@end
