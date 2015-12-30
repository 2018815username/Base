//
//  BaseUIViewController.m
//  Base
//
//  Created by qwater on 15/12/28.
//  Copyright © 2015年 qwater. All rights reserved.
//

#import "BaseUIViewController.h"

@interface BaseUIViewController ()

@end

@implementation BaseUIViewController


+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    BaseUIViewController *baseViewController = [super allocWithZone:zone];
    @weakify(baseViewController)
    [[baseViewController
      rac_signalForSelector:@selector(viewDidLoad)]
     subscribeNext:^(id x) {
         @strongify(baseViewController)
         [baseViewController bindViewModel];
         
     }];
    
    return baseViewController;
}
-(instancetype) initWithViewModel:(BaseViewModel *) viewModel
{
    self = [super init];
    if(self)
    {
        _viewModel = viewModel;
    }
    else
    {
//        @throw [[NSError alloc] init];
    }


    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    // Do any additional setup after loading the view from its nib.
}


-(void) setSubViews
{
    Debug(@"setSubViews");
}

-(void) bindViewModel
{
    Debug(@"bindViewModel");
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSUInteger) height
{
    return self.view.bounds.size.height;
}
-(NSUInteger) width
{
    return self.view.bounds.size.width;
}
-(NSUInteger) x;
{
    return self.view.frame.origin.x;
    
}
-(NSUInteger) y
{
    return self.view.frame.origin.y;
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
