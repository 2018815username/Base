//
//  MainViewController.m
//  Base
//
//  Created by qwater on 15/12/28.
//  Copyright © 2015年 qwater. All rights reserved.
//

#import "MainViewController.h"
#import "HomeViewController.h"
#import "FindViewController.h"
#import "MineViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupViewControllers];
}

-(void) setupViewControllers
{
    self.navigationController.navigationBarHidden = NO;
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    homeVC.tabBarItem.title = @"主页";
    FindViewController *findVC = [[FindViewController alloc] init];
    findVC.tabBarItem.title = @"发现";
    MineViewController *mineVC = [[MineViewController alloc] init];
    mineVC.tabBarItem.title = @"我的";

    
    [self addChildVc:homeVC title:@"主页"];
    [self addChildVc:findVC title:@"发现"];
    [self addChildVc:mineVC title:@"我的"];

    
}

- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title
{
    // 设置子控制器的文字
    childVc.title = title; // 同时设置tabbar和navigationBar的文字
    
    
    // 设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor greenColor];
    NSMutableDictionary *selectTextAttrs      = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs
                                      forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs
                                      forState:UIControlStateSelected];
    childVc.view.backgroundColor = [UIColor whiteColor];
    
    // 先给外面传进来的小控制器 包装 一个导航控制器
    UINavigationController *nav  = [[UINavigationController alloc] initWithRootViewController:childVc];
    nav.navigationBarHidden      = NO;
    // 添加为子控制器
    [self addChildViewController:nav];
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
