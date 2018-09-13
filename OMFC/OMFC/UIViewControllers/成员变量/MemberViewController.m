//
//  MemberViewController.m
//  OMFC
//
//  Created by kmom on 2018/9/11.
//  Copyright © 2018年 康美. All rights reserved.
//



/*
 问题：
 成员变量(实例变量)和属性变量有什么区别
 
 创建属性的时候同时生成了成员变量
 
 答案：
 局部变量存放在
 栈:
 
 全局变量存放
 静态区
 
 成员变量存放
 堆中
 
 
 https://my.oschina.net/360yg/blog/1626086
 */
#import "MemberViewController.h"
#import "MemberPerson.h"
@interface MemberViewController ()

@end

@implementation MemberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    MemberPerson *per = [MemberPerson new];
    per.age = @20;
    
    unsigned int count = 0;
    
    //获取类的所有成员变量
    Ivar *memvbers = class_copyIvarList([MemberPerson class], &count);
    
    for (int i = 0; i<count; i++)
    {
        Ivar *iva = &memvbers[i];
        // 取得变量名并转成字符串类型
        const char *memberName = ivar_getName(*iva);
        NSLog(@"变量名 = %s",memberName);
        
    }
    
    
    // 获取类的所有成员属性
    objc_property_t *properties =class_copyPropertyList([MemberPerson class], &count);
    for (int i = 0; i<count; i++)
    {
        objc_property_t property = properties[i];
        const char* char_f =property_getName(property);
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        NSLog(@"属性名 = %@",propertyName);
    }
}



@end
