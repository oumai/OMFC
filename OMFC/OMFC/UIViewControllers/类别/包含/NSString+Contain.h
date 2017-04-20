//
//  NSString+Contain.h
//  CategoryDemo
//
//  Created by 孙 化育 on 15-5-13.
//  Copyright (c) 2015年 孙 化育. All rights reserved.
//

#import <Foundation/Foundation.h>


    //声明一个类别用 @interface 类名 (类别名)

    //类别能够给一个已经存在的类添加一些新的方法。也可以重写已经存在的方法。如果重写已经存在的方法，那么之前的方法就不能再调用。
    //类别只能添加新的方法，不能添加新的属性。
    //一个类可以添加多个类别，多个类别中的方法不能重复。

@interface NSString (Contain)


    //@property(nonatomic,assign)int number;


- (BOOL)containsString:(NSString *)aString;


    //- (BOOL)isNumberString;




@end












