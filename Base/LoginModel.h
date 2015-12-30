//
//  LoginModel.h
//  Base
//
//  Created by qwater on 15/12/28.
//  Copyright © 2015年 qwater. All rights reserved.
//

#import "BaseModel.h"

@interface LoginModel : BaseModel
@property(nonatomic, copy) NSString *userName;
@property(nonatomic, copy) NSString *password;
@property(nonatomic, copy) NSString *icode;
@end
