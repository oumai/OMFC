//
//  NSString+Contain.m
//  CategoryDemo
//
//  Created by 孙 化育 on 15-5-13.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//

#import "NSString+Contain.h"

@implementation NSString (Contain)


- (BOOL)containsString:(NSString *)aString{
    
        //rangeOfString判断字符串A在字符串B中的位置，返回一个NSRange,如果B中不包含A，那么返回的range.location等于NSNotFound.
    NSLog(@"自己写的判断");
    NSRange range = [self rangeOfString:aString];
    if (range.location == NSNotFound) {
            //不包含
        return NO;
    }else{
            //包含
        return YES;
    }
}

@end







