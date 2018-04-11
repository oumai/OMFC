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
@interface MJExtensionVC ()

@end

@implementation MJExtensionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //①简单的模型
    [self layoutMJExtention];
    //②模型中嵌套模型
    [self ModelInModel];
    //③模型中有个数组属性，数组里面又要装着其它模型
    [self withKeyValues3];
}

- (void)layoutMJExtention
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

- (void)ModelInModel
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
    NSDictionary *dict = @{
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
                           @"totalNumber" : @"2018"
                           };
    
    // 将字典转为StatusResult模型
    StatusResult *result = [StatusResult mj_objectWithKeyValues:dict];
    NSLog(@"totalNumber=%@", result.totalNumber);

}

@end
