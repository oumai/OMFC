//
//  CacheViewController.m
//  OMFC
//
//  Created by MichaeOu on 2018/8/21.
//  Copyright © 2018年 康美. All rights reserved.
//

/*
 iOS本地缓存数据方式有五种：
 
 1.直接写文件方式：可以存储的对象有NSString、NSArray、NSDictionary、NSData、NSNumber，数据全部存放在一个属性列表文件（*.plist文件）中。
 
 2.NSUserDefaults（偏好设置），用来存储应用设置信息，文件放在perference目录下。
 
 3.归档操作（NSkeyedArchiver），不同于前面两种，它可以把自定义对象存放在文件中。
 
 4.coreData:coreData是苹果官方iOS5之后推出的综合型数据库，其使用了ORM(Object Relational Mapping)对象关系映射技术，将对象转换成数据，存储在本地数据库中。coreData为了提高效率，甚至将数据存储在不同的数据库中，且在使用的时候将本地数据放到内存中使得访问速度更快。我们可以选择coreData的数据存储方式，包括sqlite、xml等格式。但也正是coreData 是完全面向对象的，其在执行效率上比不上原生的数据库。除此之外，coreData拥有数据验证、undo等其他功能，在功能上是几种持久化方案最多的。
 
 5.FMDB：FMDB是iOS平台的SQLite数据库框架，FMDB以OC的方式封装了SQLite的C语言API，使用起来更加面向对象，省去了很多麻烦、冗余的C语言代码，对比苹果自带的Core Data框架，更加轻量级和灵活，提供了多线程安全的数据库操作方法，有效地防止数据混乱。
 */

#import "CacheViewController.h"

@interface CacheViewController ()

@end

@implementation CacheViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    
    
    NSString *homePath = NSHomeDirectory();
    
    NSLog(@"homePath= %@",homePath);
    
    
    //拼接路径
    NSString *path = [homePath stringByAppendingPathComponent:@"Library/OUbOZUIBANG"];
    
    NSLog(@"path= %@",path);

    
    
}


@end
