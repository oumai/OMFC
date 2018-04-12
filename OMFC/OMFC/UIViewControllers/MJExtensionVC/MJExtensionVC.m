//
//  MJExtensionVC.m
//  OMFC
//
//  Created by MichaeOu on 2018/4/10.
//  Copyright © 2018年 康美. All rights reserved.
//

#import "MJExtensionVC.h"

#import "MJExtension.h"
#import "User.h"
#import "Status.h"
#import "StatusResult.h"
#import "OMStatusResult.h"
#import "Student.h"
@interface MJExtensionVC ()
@property (nonatomic, strong) NSDictionary *dict3;
@end

@implementation MJExtensionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //①简单的模型
    [self withKeyValues1];
    //②模型中嵌套模型
    [self withKeyValues2];
    //③模型中有个数组属性，数组里面又要装着其它模型
    [self withKeyValues3];
    [self withKeyValues3Modify];
    //④模型中的属性名和字典中的key不相同(或者需要多级映射):                  mj_replacedKeyFromPropertyName
    [self withKeyValues4];
    //⑤将一个字典数组转成模型数组 :                                      mj_objectArrayWithKeyValuesArray
    [self withKeyValues5];
    //⑥将一个模型转成字典 :                                             mj_keyValues
    [self withKeyValues6];
    //⑦将一个模型数组转成字典数组:                                       mj_keyValuesArrayWithObjectArray
    [self withKeyValues7];
}

- (void)withKeyValues1
{
    
    NSDictionary *dict = @{
                           @"name"      : @"Jack",
                           @"icon"      : @"lufy.png",
                           @"age"       : @20,
                           @"height"    : @"1.55",
                           @"money"     : @100.9,
                           @"sex"       : @(SexFemale)
                           };
    
    
    User *user = [User mj_objectWithKeyValues:dict];
    NSLog(@"name=%@, icon=%@, age=%d, height=%f, money=%@, sex=%d", user.name, user.icon, user.age, user.height, user.money, user.sex);
    
}

- (void)withKeyValues2
{
    NSDictionary *dict = @{
                           @"text" : @"是啊，今天天气确实不错！",
                           @"user" :
                               @{@"name" : @"Michael",
                                 @"icon" : @"michael.png"
                                 },
                                   
                           @"retweetedStatus" : @{@"text" : @"My heart will go on",
                                                  @"user" : @{ @"name" : @"sunny",
                                                               @"icon" : @"sunny.png" }
                                                  }
                                   
                           };
    
    //将字典转为Status模型
    Status *status = [Status mj_objectWithKeyValues:dict];
    NSString *text = status.text;
    NSString *name = status.user.name;
    NSString *icon = status.user.icon;
    NSLog(@"text=%@, name=%@, icon=%@", text, name, icon);
    
    NSString *text2 = status.retweetedStatus.text;
    NSString *name2 = status.retweetedStatus.user.name;
    NSString *icon2 = status.retweetedStatus.user.icon;
    NSLog(@"text2=%@, name2=%@, icon2=%@", text2, name2, icon2);

}

- (void)withKeyValues3
{
    self.dict3 = @{
                           @"statuses" : @[
                                   @{
                                       @"text" : @"今天天气真不错！",
                                       @"user" : @{
                                               @"name" : @"Rose",
                                               @"icon" : @"nami.png"
                                               }
                                       },
                                   
                                   @{
                                       @"text" : @"明天去旅游了",
                                       @"user" : @{
                                               @"name" : @"Jack",
                                               @"icon" : @"lufy.png"
                                               }
                                       }
                                   
                                   ],
                           @"ads" :@[
                                   @{
                                       @"image" : @"ad01.png",
                                       @"url" : @"http://www.ad01.com"
                                       },
                                   
                                   @{
                                       @"image" : @"ad02.png",
                                       @"url" : @"http://www.ad02.com"
                                       }
                                   ],
                           @"totalNumber" : @"2014"
                           };
    
   
    
    // 将字典转为StatusResult模型
    StatusResult *result = [StatusResult mj_objectWithKeyValues:self.dict3];
    NSLog(@"totalNumber=%@", result.totalNumber);

    // 打印statuses数组中的模型属性
    for (Status *status in result.statuses) {
        NSString *text = status.text;
        NSString *name = status.user.name;
        NSString *icon = status.user.icon;
        NSLog(@"text=%@, name=%@, icon=%@", text, name, icon);

    }
    
    
    //NSLog(@"image = %@",[[result.ads firstObject] objectForKey:@"image"]);
    // 打印ads数组中的模型属性
    for (Ad *ad in result.ads) {
        NSLog(@"image=%@, url=%@", ad.image, ad.url);
    }
}

- (void)withKeyValues3Modify
{
    // 将字典转为StatusResult模型
    OMStatusResult *result =[OMStatusResult mj_objectWithKeyValues:self.dict3];
    NSLog(@"totalNumber=%@", result.totalNumber);
    
    // 打印statuses数组中的模型属性
    for (OMStatus *status in result.statuses) {
        NSString *text = status.text;
        NSString *name = status.user.name;
        NSString *icon = status.user.icon;
        NSLog(@"text=%@, name=%@, icon=%@", text, name, icon);
        
    }
    
    
    //NSLog(@"image = %@",[[result.ads firstObject] objectForKey:@"image"]);
    // 打印ads数组中的模型属性
    for (OMAds *ad in result.ads) {
        NSLog(@"image=%@, url=%@", ad.image, ad.url);
    }
}

- (void)withKeyValues4
{

    NSDictionary *dict = @{
                           @"id":@"20",
                           @"desciption":@"孩子",
                           @"name":@{
                                   @"newName":@"lucky",
                                   @"oldName":@"misfortune",
                                   @"info":@{ @"nameChangedTime" : @"2013-08"}
                                   },
                           @"other":@{
                                   @"bag":@{
                                           @"name" : @"小书包",
                                           @"price" : @100.7
                                           }
                                   
                                   }
                           
                           };
    
    Student *stu = [Student mj_objectWithKeyValues:dict];
    NSLog(@"ID=%@, desc=%@, oldName=%@, nowName=%@, nameChangedTime=%@", stu.ID, stu.desc, stu.oldName, stu.neewName, stu.nameChangedTime);
    NSLog(@"bagName=%@, bagPrice=%f,bag = %@", stu.bag.name, stu.bag.price,stu.bag);
    
}


- (void)withKeyValues5
{
    NSArray *dictArray = @[
                           @{
                               @"name" : @"Jack",
                               @"icon" : @"lufy.png",
                               },
                           @{
                               @"name" : @"Rose",
                               @"icon" : @"nami.png",
                               }
                           ];
    
    // 将字典数组转为User模型数组
    NSArray *userArray = [User mj_objectArrayWithKeyValuesArray:dictArray];
    // 打印userArray数组中的User模型属性
    for (User *user in userArray) {
        NSLog(@"name=%@, icon=%@", user.name, user.icon);}
    
  
}

- (void)withKeyValues6
{
    // 新建模型
    User *user = [[User alloc] init];
    user.name = @"迈克";
    user.money = [NSNumber numberWithInteger:1000000000000];

    Status *status = [[Status alloc] init];
    status.user = user;
    status.text = @"今天心情不错";
    
    // 将模型转为字典
    NSDictionary *statusDict = status.mj_keyValues;
    NSLog(@"statusDict = %@", statusDict);
  
    
    // 多级映射的模型
    Student *stu = [[Student alloc] init];
    stu.ID = @"123";
    stu.oldName = @"rose";
    stu.neewName = @"jack";
    stu.desc = @"handsome";
    stu.nameChangedTime = @"2018-09-08";
    
    Bag *bag = [[Bag alloc] init];
    bag.name = @"小书包";
    bag.price = 205;
    stu.bag = bag;
    NSDictionary *stuDict = stu.mj_keyValues;
    
    NSLog(@"%@", stuDict);
    
   
}

- (void)withKeyValues7
{
    //新建模型数组
    User *user1 = [[User alloc] init];
    user1.name = @"Michael";
    user1.age = 18;
    
    
    User *user2 = [[User alloc] init];
    user2.name = @"刘诚";
    user2.money =  [NSNumber numberWithInteger:1000000000000];
    
    NSArray *userArray = @[user1,user2];
    //将数组转换成字典
    NSArray *dictArray = [User mj_keyValuesArrayWithObjectArray:userArray];
    
    NSLog(@"%@", dictArray);

}

@end
