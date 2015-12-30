//
//  LoginViewController.m
//  Base
//
//  Created by qwater on 15/12/28.
//  Copyright © 2015年 qwater. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"

@interface LoginViewController ()
@property (nonatomic, strong) LoginView *loginView;
@end
@implementation LoginViewController
@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setSubViews];
}

-(void) setSubViews
{
    _loginView = [[LoginView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
    [_loginView setSubviews];
    [self.view addSubview:_loginView];
    [_loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(@(160));
        make.left.mas_equalTo(@(0));
        make.right.mas_equalTo(@(0));
        make.height.mas_equalTo(@(220));
    }];
}

-(void) bindViewModel
{
   
    [[_loginView.userNameTF rac_textSignal] subscribeNext:^(id x) {
        Debug(@"%@",x);
    }];
    
    RAC(self.viewModel.model, userName) = _loginView.userNameTF.rac_textSignal;
    RAC(self.viewModel.model, password) = _loginView.passwordTF.rac_textSignal;
    
    // 监听登录按钮点击
    [[_loginView.submitBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
        // 执行登录事件
        [self.viewModel.loginCommand execute:nil];
    }];
}

@end
