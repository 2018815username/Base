//
//  LoginViewModel.h
//  Base
//
//  Created by qwater on 15/12/28.
//  Copyright © 2015年 qwater. All rights reserved.
//

#import "BaseViewModel.h"
#import "LoginModel.h"
#import "Book.h"

@interface LoginViewModel : BaseViewModel
@property (nonatomic, strong) LoginModel *model;
@property (nonatomic, strong) RACCommand *loginCommand;
@property (nonatomic, strong) RACSignal *enableLoginSignal;

@end
