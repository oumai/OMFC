
//
//  Student.m
//  OMFC
//
//  Created by MichaeOu on 2018/4/12.
//  Copyright © 2018年 康美. All rights reserved.
//

#import "Student.h"
#import "MJExtension.h"

@implementation Bag
@end



@implementation Student
// 实现这个方法的目的：告诉MJExtension框架模型中的属性名对应着字典的哪个key

/*
 ①左边的是Key与属性必须相等
 ②
 */
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
             @"ID":@"id",
             @"desc":@"desciption",
             @"oldName":@"name.oldName",
             @"neewName":@"name.newName",
             @"nameChangedTime":@"name.info.nameChangedTime",
             @"bag":@"other.bag",

             };
}

@end
