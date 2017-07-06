//
//  OMMainVC.m
//  OMFC
//
//  Created by MichaeOu on 2017/7/6.
//  Copyright © 2017年 康美. All rights reserved.
//

#import "OMMainVC.h"

@interface OMMainVC ()

@end

@implementation OMMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
#if DEBUG
    //默认环境是生产
    NSString *string = KMShengChan;
    if (HostFlag == 0) {//生产
        
        string = KMShengChan;
    }
    else if (HostFlag == 1){//演示
        string = KMYanShi;
    }
    else if (HostFlag == 2){//测试
        string = KMCeShi;
    }
    
    else if (HostFlag == 3){//外网
        string = @"";
    }
    else if (HostFlag == 4){//灰度
        string = @"";
    }
    NSLog(@"string = %@",string);
    
    
#else
    
    NSString *string = KMShengChan;
    
#endif

}

@end
