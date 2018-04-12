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
@implementation StatusResult



// 实现这个方法的目的：告诉MJExtension框架statuses和ads数组里面装的是什么模型
//第①种方法
/**/

//+ (NSDictionary *)mj_objectClassInArray
//{
//    return @{@"statuses":[Status class]};
//}


//第②种方法
//这个方法对比上面的2个方法更加没有侵入性和污染，因为不需要导入Status和Ad的头文件
+ (NSDictionary *)mj_objectClassInArray{
    return @{
             @"statuses" : @"Status",
             @"ads" : @"Ad"
             };
}
@end


@implementation Ad
//
//+ (NSDictionary *)mj_objectClassInArray
//{
//    return @{@"ads":[Ad class]};
//}
//
@end





//第③种方法 和②类似
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

