//
//  BaseUIView.m
//  Base
//
//  Created by qwater on 15/12/28.
//  Copyright © 2015年 qwater. All rights reserved.
//

#import "BaseUIView.h"

@implementation BaseUIView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(NSUInteger) height
{
    return self.bounds.size.height;
}
-(NSUInteger) width
{
    return self.bounds.size.width;
}
-(NSUInteger) x;
{
    return self.frame.origin.x;

}
-(NSUInteger) y
{
    return self.frame.origin.y;
}
@end
