//
//  SinletonViewController.m
//  OMFC
//
//  Created by MichaeOu on 2018/4/3.
//  Copyright © 2018年 康美. All rights reserved.
//

#import "SinletonViewController.h"
#import "OMManager.h"
@interface SinletonViewController ()

@end

@implementation SinletonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    OMManager *ma = [OMManager shareOMManager];
    
    OMManager *man = [[OMManager alloc] init];
    
    
    OMManager *mana = [ma copy];
    
    
    OMManager *manag = [ma mutableCopy];
    
    
    NSLog(@"%p,%p,%p,%p",ma,man,mana,manag);
}



@end
