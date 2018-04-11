//
//  StatusResult.m
//  OMFC
//
//  Created by MichaeOu on 2018/4/10.
//  Copyright © 2018年 康美. All rights reserved.
//

#import "StatusResult.h"
#import "MJExtension.h"
#import "User.h"
#import "Status.h"
@class Ad;
@implementation StatusResult
// 实现这个方法的目的：告诉MJExtension框架statuses和ads数组里面装的是什么模型

/**/
// + (NSDictionary *)objectClassInArray{
//
//
//     return  @{
//               @"statuses" : [Status class],
//               @"ads" : [Ad class]    };
// }
//
// + (Class)objectClassInArray:(NSString *)propertyName{
//     if ([propertyName isEqualToString:@"statuses"])
//     {
//         return [Status class];
//     }
//     else if ([propertyName isEqualToString:@"ads"])
//     {
//         return [Ad class];
//
//     }
//     return nil;
//
// }


//这个方法对比上面的2个方法更加没有侵入性和污染，因为不需要导入Status和Ad的头文件
+ (NSDictionary *)mj_objectClassInArray{
    return @{
             @"statuses" : @"Status",
             @"ads" : @"Ad"
             };
}
//- (id)initWithCoder:(NSCoder *)decoder
//{
//    if (self = [super init]) {
//        [self mj_decode:decoder];
//    }
//    return self;
//}
//
//- (void)encodeWithCoder:(NSCoder *)encoder
//{
//    [self mj_encode:encoder];
//}
//+ (NSDictionary *)mj_objectClassInArray
//{
//
//    return @{}
//}
@end


