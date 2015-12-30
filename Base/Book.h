//
//  Book.h
//  Base
//
//  Created by qwater on 15/12/30.
//  Copyright © 2015年 qwater. All rights reserved.
//

#import "BaseModel.h"

@interface Book : BaseModel

+(Book *) initWithDict:(NSDictionary *) dict;
@end
