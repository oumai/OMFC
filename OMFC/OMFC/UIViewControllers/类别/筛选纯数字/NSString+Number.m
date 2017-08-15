//
//  NSString+Number.m
//  OMFC
//
//  Created by Omichael on 2017/4/12.
//  Copyright © 2017年 康美. All rights reserved.
//

#import "NSString+Number.h"

@implementation NSString (Number)

/*
 有参数
 */
//筛选出数字的总个数
+ (NSUInteger)countWithString:(NSString *)str
{
    
    NSUInteger count = 0;
    
    for (int i = 0; i<str.length; i++)
    {
        unichar c = [str characterAtIndex:i];
        
        if (c > '0'&& c <= '9') {
            count++;
        }
    }
    return count;

}

//筛选出数字拼接成的字符串
+ (NSString *)numberWithString:(NSString *)str
{
    
    NSMutableArray *mutableArray = [NSMutableArray array];

    for (int i = 0; i<str.length; i++)
    {
        unichar C = [str characterAtIndex:i];
        
        if (C > '0'&& C<'9') {
            [mutableArray addObject:[NSString stringWithFormat:@"%C",C]];
        }
    }
    
    
    NSString *string = [mutableArray componentsJoinedByString:@""];
    return string;

}

/*
 无参数
 */
- (NSUInteger)countWithString
{
    NSUInteger count = 0;
    
    for (int i = 0; i<self.length; i++)
    {
        unichar c = [self characterAtIndex:i];
        
        if (c > '0'&& c <= '9') {
            count++;
        }
    }
    return count;

}


/*
 无返回值
 */
+ (void)numberWithOutString:(NSString *)str returnString:(NSString *)returnString
{
    NSMutableArray *mutableArray = [NSMutableArray array];
    
    for (int i = 0; i<str.length; i++)
    {
        unichar C = [str characterAtIndex:i];
        
        if (C > '0'&& C<'9') {
            [mutableArray addObject:[NSString stringWithFormat:@"%C",C]];
        }
    }
    
    NSString *string = [mutableArray componentsJoinedByString:@""];

    returnString = string;
}

@end
