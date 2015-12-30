//
//  LoginViewModel.m
//  Base
//
//  Created by qwater on 15/12/28.
//  Copyright © 2015年 qwater. All rights reserved.
//

#import "LoginViewModel.h"

@implementation LoginViewModel


-(instancetype) init
{
    self = [super init];
    if(self)
    {
        [self initialBind];
    }
    return self;
}


// 初始化绑定
- (void)initialBind
{
    
    _model = [[LoginModel alloc] init];
    // 监听账号的属性值改变，把他们聚合成一个信号。
    _enableLoginSignal = [RACSignal combineLatest:@[RACObserve(self.model, userName),
                                                    RACObserve(self.model, password)]
                                           reduce:^id(NSString *account, NSString *pwd){
        
        return @(account.length && pwd.length);
        
    }];
    
    // 处理登录业务逻辑
    _loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        RACSignal *requestSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            
            
            NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
            parameters[@"q"] = @"基础";
            
            // 发送请求
            [[AFHTTPRequestOperationManager manager] GET:@"https://api.douban.com/v2/book/search" parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
                NSLog(@"%@",responseObject);
                
                // 请求成功调用
                // 把数据用信号传递出去
                [subscriber sendNext:responseObject];
                
                [subscriber sendCompleted];
                
                
            } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
                // 请求失败调用
                
            }];
            
            return nil;
        }];
        
        
        
        
        // 在返回数据信号时，把数据中的字典映射成模型信号，传递出去
        return [requestSignal map:^id(NSDictionary *value) {
            NSMutableArray *dictArr = value[@"books"];
            
            // 字典转模型，遍历字典中的所有元素，全部映射成模型，并且生成数组
            NSArray *modelArr = [[dictArr.rac_sequence map:^id(id value) {
                return [Book initWithDict:value];
            }] array];
            
            return modelArr;
        }];    }];
    
    // 监听登录产生的数据
    [_loginCommand.executionSignals.switchToLatest subscribeNext:^(id x) {
        if ([x isEqualToString:@"登录成功"]) {
            NSLog(@"登录成功");
        }
    }];
    
    // 4.监听命令是否执行完毕,默认会来一次，可以直接跳过，skip表示跳过第一次信号。
    [[_loginCommand.executing skip:0] subscribeNext:^(id x) {
        if ([x isEqualToNumber:@(YES)]) {
            
            // 正在登录ing...
            // 用蒙版提示
            NSLog(@"正在登录...");
        }
        NSLog(@"%@", x);

    }];
}
@end
