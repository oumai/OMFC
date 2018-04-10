//
//  SampleObject.m
//  TestApp
//
//  Created by MichaeOu on 2018/4/9.
//  Copyright © 2018年 康美. All rights reserved.
//

#import "SampleObject.h"

@implementation SampleObject


- (void)dealloc{
    
    NSLog(@"dealloc %@",[self class]);
    
}
@end
