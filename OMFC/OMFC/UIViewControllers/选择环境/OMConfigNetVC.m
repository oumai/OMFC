//
//  OMConfigNetVC.m
//  OMFC
//
//  Created by MichaeOu on 2017/7/6.
//  Copyright © 2017年 康美. All rights reserved.
//

#import "OMConfigNetVC.h"

@interface OMConfigNetVC ()

@end

@implementation OMConfigNetVC

//项目基色
#define BaseColor [UIColor colorWithRed:255.0/255.f green:110.0/255.f blue:127.0/255.f alpha:1.0]

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    self.title = @"域名配置";
    [self initView];
}

-(void)initView{
    for (int i = 0; i <=4 ; i++) {
        
        //为什么这里第一次创建了，颜色不会变白色。
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i+100;
        [button setTitle:[self setButtonTitle:button] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(changeHost:) forControlEvents:UIControlEventTouchUpInside];
        button.frame = CGRectMake(20, 64+50*i, [UIScreen mainScreen].bounds.size.width - 20*2, 50);
        [self.view addSubview:button];
    }
    NSLog(@"%ld",(long)[[NSUserDefaults standardUserDefaults]integerForKey:@"HOST"]);
    UIButton *button = [self.view viewWithTag:[[NSUserDefaults standardUserDefaults]integerForKey:@"HOST"]];
    [self setButtonBackColor:button];
}

-(NSString *)setButtonTitle:(UIButton *)sender{
    NSInteger tag = sender.tag;
    NSString *string = [[NSString alloc]init];
    switch (tag-100) {
        case 0:
            string = @"生产";
            break;
        case 1:
            string = @"演示";
            break;
        case 2:
            string = @"测试";
            break;
        case 3:
            string = @"外网";
            break;
        case 4:
            string = @"灰度";
            break;
        default:
            break;
    }
    
    
    return string;
}

-(void)setButtonBackColor:(UIButton *)sender{
    for (int i = 0; i <=4 ; i++) {
        UIButton *button = [self.view viewWithTag:i+100];
        [button setBackgroundColor:[UIColor lightGrayColor]];
    }
    [sender setBackgroundColor:kBuleColor];
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(void)changeHost:(UIButton *)sender{
    [[NSUserDefaults standardUserDefaults]setInteger:sender.tag forKey:@"HOST"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    NSLog(@"%ld",(long)[[NSUserDefaults standardUserDefaults]integerForKey:@"HOST"]);
    [self setButtonBackColor:sender];
}


- (void)viewLayoutMarginsDidChange
{
    
}



@end
