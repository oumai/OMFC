//
//  Person.h
//  OMFC
//
//  Created by MichaeOu on 2018/4/3.
//  Copyright © 2018年 康美. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, assign) NSInteger age;


- (void)say;
- (void)say:(NSString *)str;
- (void)say:(NSString *)str doSomething:(NSString *)string;

@end
