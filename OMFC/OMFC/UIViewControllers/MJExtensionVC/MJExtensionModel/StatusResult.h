//
//  StatusResult.h
//  OMFC
//
//  Created by MichaeOu on 2018/4/10.
//  Copyright © 2018年 康美. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ad : NSObject
@property (copy, nonatomic) NSString *image;
@property (copy, nonatomic) NSString *url;
@end



@interface StatusResult : NSObject

/** 存放着一堆的微博数据（里面都是Status模型） */
@property (strong, nonatomic) NSMutableArray *statuses;
/** 存放着一堆的广告数据（里面都是Ad模型） */
@property (strong, nonatomic) NSArray *ads;
@property (strong, nonatomic) NSNumber *totalNumber;


@end
