
//
//  AngelDoctor.h
//  OMUI
//
//  Created by MichaeOu on 2017/6/29.
//  Copyright © 2017年 康美. All rights reserved.
//

#ifndef AngelDoctor_h
#define AngelDoctor_h


//天使医生
#define BaseColor [UIColor colorWithRed:255.0/255.f green:110.0/255.f blue:127.0/255.f alpha:1.0] //项目基色
#define HostFlag     ([[NSUserDefaults standardUserDefaults]integerForKey:@"HOST"]-100)        //域名标志（用于测试随意切换域名测试）


#define   KMYanShi     @"http://www.ztyshj.kmhealthcloud.com:8110"
#define   KMShengChan  @"http://djymbgl.kmhealthcloud.com:9001"
#define   KMCeShi      @"http://10.2.29.83:6033"
#endif /* AngelDoctor_h */
