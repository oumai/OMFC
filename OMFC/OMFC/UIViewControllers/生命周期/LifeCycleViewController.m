//
//  LifeCycleViewController.m
//  OMFC
//
//  Created by MichaeOu on 2018/4/4.
//  Copyright © 2018年 康美. All rights reserved.
//https://www.jianshu.com/p/d60b388b19f5

#import "LifeCycleViewController.h"

@interface LifeCycleViewController ()

@end

@implementation LifeCycleViewController

// 非storyBoard(xib或非xib)都走这个方法
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        NSLog(@"1 %s",__func__);
    }
    return self;
}
// 如果连接了串联图storyBoard 走这个方法
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        NSLog(@"2 %s",__func__);

    }
    return self;
}
// xib 加载 完成
- (void)awakeFromNib
{
    [super awakeFromNib];
    NSLog(@"3 %s",__func__);

}

// 加载视图(默认从nib)
//- (void)loadView
//{
//    NSLog(@"4 %s",__func__);
//}

//视图控制器中的视图加载完成，viewController自带的view加载完成
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSLog(@"5 %s",__func__);

}

//视图将要出现
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"6 %s",__func__);

}

// view 即将布局其 Subviews
- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    NSLog(@"7 %s",__func__);

}

// view 已经布局其 Subviews
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    NSLog(@"8 %s",__func__);

}

//视图已经出现
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"9 %s",__func__);

}

//视图将要消失
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"10 %s",__func__);

}

//视图已经消失
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"11 %s",__func__);

}
//出现内存警告  //模拟内存警告:点击模拟器->hardware-> Simulate Memory Warning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"12 %s",__func__);
    
}
// 视图被销毁
- (void)dealloc {
    NSLog(@"13 %s",__func__);

}


@end
