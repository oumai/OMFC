//
//  OMPerson.h
//  OMFC
//
//  Created by kmom on 2018/9/11.
//  Copyright © 2018年 康美. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MemberPerson : NSObject
{
@private
    //name为私有成员变量
    NSString *name;
}
// age 为成员属性
@property (nonatomic ,copy) NSString *age;
@end
