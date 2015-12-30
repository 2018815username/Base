//
//  BaseUIViewController.h
//  Base
//
//  Created by qwater on 15/12/28.
//  Copyright © 2015年 qwater. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewModel.h"


@interface BaseUIViewController : UIViewController
@property (nonatomic, strong) BaseViewModel *viewModel;

-(NSUInteger) height;
-(NSUInteger) width;
-(NSUInteger) x;
-(NSUInteger) y;
-(instancetype) initWithViewModel:(BaseViewModel *) viewModel;
-(void) setSubViews;
-(void) bindViewModel;
@end
