//
//  NSArray+Log.m
//  Test分类联系
//
//  Created by Siman on 2017/4/13.
//  Copyright © 2017年 com.michael.siman. All rights reserved.
//

#import "NSArray+Log.h"

@implementation NSArray (Log)
//- (NSString *)descriptionWithLocale:(id)locale
//{
//    NSMutableString *strM = [NSMutableString string];
//    [strM appendString:@"(\n"];
//
//    for (id obj in self) {
//        [strM appendFormat:@"\t%@,\n", obj];
//    }
//    [strM appendString:@")"];
//    return strM;
//
//}

//- (NSString *)descriptionWithLocale:(id)locale
//{
//    NSMutableString *string = [NSMutableString string];
//    
//    // 开头有个[
//    [string appendString:@"(\n"];
//    
//    // 遍历所有的元素
//    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//        [string appendFormat:@"\t%@,\n", obj];
//    }];
//    
//    // 结尾有个]
//    [string appendString:@")"];
//    
//    // 查找最后一个逗号
//    NSRange range = [string rangeOfString:@"," options:NSBackwardsSearch];
//    if (range.location != NSNotFound)
//        [string deleteCharactersInRange:range];
//    
//    return string;
//}


/**
 解决数组输出中文乱码的问题
 
 @return 输出结果
 */
- (NSString *)descriptionWithLocale:(id)locale {
    
    NSMutableString *string = [NSMutableString stringWithString:@"(\n"];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        [string appendFormat:@"\t%@,\n", obj];
    }];
    if ([string hasSuffix:@",\n"]) {
        
        [string deleteCharactersInRange:NSMakeRange(string.length - 2, 1)]; // 删除最后一个逗号
    }
    [string appendString:@")\n"];
    
    return string;
}

@end
