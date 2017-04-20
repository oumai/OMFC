//
//  NSString+Number.h
//  OMFC
//
//  Created by Omichael on 2017/4/12.
//  Copyright © 2017年 康美. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Number)


+ (NSUInteger)countWithString:(NSString *)str;

+ (NSString *)numberWithString:(NSString *)str;

- (NSUInteger)countWithString;


+ (void)numberWithOutString:(NSString *)str returnString:(NSString *)returnString
;
@end
