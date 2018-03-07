//
//  Tools.h
//  OMFC
//
//  Created by MichaeOu on 2017/7/20.
//  Copyright © 2017年 康美. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tools : NSObject
+ (UIImage *) compressImageWithImage:(UIImage *)orignalImage ScalePercent:(CGFloat)percent;


/**
 *  格式化时间
 *
 *  @param date   时间
 *  @param format 格式
 *
 *  @return 格式化后的时间
 */
+ (NSString *)getDateStringWithDate:(NSDate *)date Format:(NSString *)format;



/**
 *  md5加密
 *
 *  @param str 未加密字符串
 *
 *  @return 加密字符串
 */
+ (NSString *)md5String:(NSString *)str;
@end
