//
//  HardWareViewController.m
//  OMFC
//
//  Created by MichaeOu on 2017/12/15.
//  Copyright © 2017年 康美. All rights reserved.
//

#import "HardWareViewController.h"
#import <AudioToolbox/AudioToolbox.h>
@interface HardWareViewController ()

@end

@implementation HardWareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor cyanColor];
    button.frame = CGRectMake(100, 100, 100, 100);
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}


- (void)buttonClick
{
    //让手机震动
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
   
}
@end
