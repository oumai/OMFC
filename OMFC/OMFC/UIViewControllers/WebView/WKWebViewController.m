//
//  WKWebViewController.m
//  OMFC
//
//  Created by MichaeOu on 2018/8/20.
//  Copyright © 2018年 康美. All rights reserved.
//
#define AppColor        RGB(33,131,245)

#import "WKWebViewController.h"
#import <WebKit/WebKit.h>
#import "WHAnimation.h"
@interface WKWebViewController ()<WKUIDelegate,WKNavigationDelegate>

@property (nonatomic, strong) UIView *hudView;
@property (nonatomic, strong) WKWebView *webView;
@end

@implementation WKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.webView];
    [self.view addSubview:self.hudView];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
    
    
}

#pragma mark === WKNavigationDelegate 加载的状态回调
// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    
    [self showHudView];

}
// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    
    
}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    
    [self dismissHudView];
 
    //    [webView evaluateJavaScript:@"alert('1111')" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
    //        NSLog(@"result == %@",result);
    //    }];
    
    
    return;
}


- (void)showHudView
{
    [UIView animateWithDuration:0.3f animations:^{
        
        self.hudView.alpha = 1;
        
    }];
    
}

- (void)dismissHudView
{
    [UIView animateWithDuration:0.3f animations:^{
        
        self.hudView.alpha = 0;
        
    }];
}



- (WKWebView *)webView
{
    if (!_webView) {
        _webView = [[WKWebView alloc] initWithFrame:self.view.frame]; //configuration:nil];
        _webView.UIDelegate = self;
        _webView.navigationDelegate = self;
    }
    return _webView;
}



- (UIView *)hudView
{
    if (!_hudView) {
        _hudView = [[UIView alloc] init];
        _hudView.center = CGPointMake((CoreWidth-50)/2, CoreHeight/2-50);
        [_hudView.layer addSublayer:[WHAnimation replicatorLayer_Triangle:AppColor]];
        //_hudView.backgroundColor = [UIColor grayColor];
        _hudView.alpha = 0;

    }
    return _hudView;
}
@end
