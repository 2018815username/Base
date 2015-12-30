//
//  MineViewController.m
//  Base
//
//  Created by qwater on 15/12/28.
//  Copyright © 2015年 qwater. All rights reserved.
//

#import "MineViewController.h"
#import "LoginViewController.h"
#import "LoginViewModel.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    //给定button在view上的位置
    button1.frame = CGRectMake(20, 120, 280, 40);
    
    //button背景色
    button1.backgroundColor = [UIColor greenColor];
    
    //设置button填充图片
    //[button1 setImage:[UIImage imageNamed:@"btng.png"] forState:UIControlStateNormal];
    
    //设置button标题
    [button1 setTitle:@"点击" forState:UIControlStateNormal];
    
    button1.adjustsImageWhenHighlighted = NO;
    /*跟上面的情况一样，默认情况下，当按钮禁用的时候，图像会被画得深一点，设置NO可以取消设置*/
    button1.adjustsImageWhenDisabled = NO;
    /* 下面的这个属性设置为yes的状态下，按钮按下会发光*/
    button1.showsTouchWhenHighlighted = YES;
    
    //显示控件
    [self.view addSubview:button1];

    [[button1 rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        AppDelegate *appDlg = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        NetworkStatus status = [appDlg.reach currentReachabilityStatus];
        NSLog(@"reachiblity%@",[appDlg.reach isReachable] == YES ? @"yes" : @"no");
        if (status == NotReachable) {
            //        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"网络已断开" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            //        [alertView show];
            NSLog(@"----Notification Says Unreachable");
        }else if(status == ReachableViaWWAN){
            //        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"移动网络" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            //        [alertView show];
            NSLog(@"----Notification Says mobilenet");
        }else if(status == ReachableViaWiFi){
            //        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"WIfi网络" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            //        [alertView show];
            NSLog(@"----Notification Says wifinet");
        }

        LoginViewController *loginVC = [[LoginViewController alloc] initWithViewModel:[[LoginViewModel alloc] init]];
        [self.navigationController pushViewController:loginVC animated:YES];
    } error:^(NSError *error) {
        
    } completed:^{
        
    }];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
