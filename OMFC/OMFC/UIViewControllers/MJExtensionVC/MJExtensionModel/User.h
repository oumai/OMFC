//
//  User.h
//  TestApp
//
//  Created by MichaeOu on 2018/4/10.
//  Copyright © 2018年 康美. All rights reserved.
//

//字典转模型
#import <Foundation/Foundation.h>

@interface User : NSObject
typedef enum {
    SexMale,
    SexFemale} Sex;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *icon;
@property (assign, nonatomic) int age;
@property (assign, nonatomic) double height;
@property (strong, nonatomic) NSNumber *money;
@property (assign, nonatomic) Sex sex;
@end
