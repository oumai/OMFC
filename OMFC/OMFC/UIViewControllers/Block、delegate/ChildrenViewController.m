//
//  ChildrenViewController.m
//  OMFC
//
//  Created by MichaeOu on 2018/4/8.
//  Copyright © 2018年 康美. All rights reserved.
//

#import "ChildrenViewController.h"

@interface ChildrenViewController ()

@end

@implementation ChildrenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [button setFrame:CGRectMake(100, 100, 200, 200)];
    [button setBackgroundColor:[UIColor cyanColor]];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonClick
{
    [self.navigationController popViewControllerAnimated:YES];
    
    
    if (self.popBlock) {
        self.popBlock(@[@"tom",@"jerry"], @"火影");
    }
  
    
}

@end
