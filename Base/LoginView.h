//
//  LoginView.h
//  Base
//
//  Created by qwater on 15/12/29.
//  Copyright © 2015年 qwater. All rights reserved.
//

#import "BaseUIView.h"

@interface LoginView : BaseUIView
@property (nonatomic, strong) UITextField *userNameTF;
@property (nonatomic, strong) UITextField *passwordTF;
@property (nonatomic, strong) UIButton *submitBtn;
-(void) setSubviews;
@end
