//
//  Tools.m
//  OMFC
//
//  Created by MichaeOu on 2017/7/20.
//  Copyright © 2017年 康美. All rights reserved.
//

#import "Tools.h"

@implementation Tools


#pragma mark - 图片压缩方法
+ (UIImage *) compressImageWithImage:(UIImage *)orignalImage ScalePercent:(CGFloat)percent
{
    if (orignalImage.size.width - 640 > 0) {
        CGSize imgSize = orignalImage.size;
        
        CGFloat fScale = 640 / orignalImage.size.width;
        
        imgSize.width = 640;
        imgSize.height = fScale * orignalImage.size.height;
        
        // 压缩图片质量
        UIImage *imageReduced = [self reduceImage:orignalImage percent:percent];
        
        // 压缩图片尺寸
        UIImage *imageCompress = [self imageWithImageSimple:imageReduced scaledToSize:imgSize];
        
        return imageCompress;
    }
    else {
        return orignalImage;
    }
}

// 压缩图片质量
+ (UIImage *)reduceImage:(UIImage *)image percent:(float)percent
{
    NSData *imageData = UIImageJPEGRepresentation(image, percent);
    UIImage *newImage = [UIImage imageWithData:imageData];
    return newImage;
}

//压缩图片尺寸
+ (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    // Return the new image.
    return newImage;
}

#pragma mark - date转string
+ (NSString *)getDateStringWithDate:(NSDate *)date Format:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    
    NSString *strTime = [formatter stringFromDate:date];
    
    return strTime;
}


#pragma mark - md5加密
+ (NSString *)md5String:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}
@end
