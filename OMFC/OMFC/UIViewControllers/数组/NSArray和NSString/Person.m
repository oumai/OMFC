//
//  Person.m
//  OMFC
//
//  Created by MichaeOu on 2018/4/3.
//  Copyright © 2018年 康美. All rights reserved.
//

#import "Person.h"

@implementation Person


- (void)say
{
    NSLog(@"100");
}
- (void)say:(NSString *)str
{
    NSLog(@"str = %@ 100" ,str);
}
- (void)say:(NSString *)str doSomething:(NSString *)string
{
    NSLog(@"%@%@ 100",str,string);
}

@end
