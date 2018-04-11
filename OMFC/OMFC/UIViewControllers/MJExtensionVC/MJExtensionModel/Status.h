//
//  Status.h
//  TestApp
//
//  Created by MichaeOu on 2018/4/10.
//  Copyright © 2018年 康美. All rights reserved.
//
//模型中嵌套模型
#import <Foundation/Foundation.h>
#import "User.h"
@interface Status : NSObject
/** 微博文本内容 */
@property (copy, nonatomic) NSString *text;
/** 微博作者 */
@property (strong, nonatomic) User *user;
/** 转发的微博 */
@property (strong, nonatomic) Status *retweetedStatus;


@end
