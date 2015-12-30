//
//  LoginView.m
//  Base
//
//  Created by qwater on 15/12/29.
//  Copyright © 2015年 qwater. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView





-(void) setSubviews
{
    _userNameTF = [[UITextField alloc] init];//[[UITextField alloc] init];
    _userNameTF.borderStyle = UITextBorderStyleRoundedRect;
    _userNameTF.placeholder = @"账号";
    [self addSubview:_userNameTF];
    [_userNameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(@(20));
        make.left.mas_equalTo(@(20));
        make.right.mas_equalTo(@(-20));
        make.height.mas_equalTo(@(28));
    }];
    
    _passwordTF = [[UITextField alloc] init];//[[UITextField alloc] init];
    _passwordTF.borderStyle = UITextBorderStyleRoundedRect;
    _passwordTF.placeholder = @"密码";
    [self addSubview:_passwordTF];
    [_passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_userNameTF.mas_bottom).offset(20);
        make.left.mas_equalTo(@(20));
        make.right.mas_equalTo(@(-20));
        make.height.mas_equalTo(@(28));
    }];
    
    _submitBtn =  [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_submitBtn setTitle:@"确定" forState:UIControlStateNormal];
    _submitBtn.frame = CGRectMake(20, 120, 280, 40);

    _submitBtn.backgroundColor = [UIColor greenColor];//button的背景颜色
    [self addSubview:_submitBtn];
    @weakify(self);
    [_submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.mas_equalTo(_passwordTF.mas_bottom).offset(20);
        make.centerX.mas_equalTo(self);
        make.height.mas_equalTo(@(28));
        make.width.mas_equalTo(@(128));
    }];
    
}

@end
