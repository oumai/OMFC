//
//  OMModifyStatusResult.m
//  OMFC
//
//  Created by MichaeOu on 2018/4/12.
//  Copyright © 2018年 康美. All rights reserved.
//

#import "OMStatusResult.h"

@implementation OMStatusResult

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"statuses":[OMStatus class],
             @"ads":[OMAds class]
             };
}
@end


@implementation OMAds



@end




@implementation OMStatus

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"user":[User class]};
}
@end
