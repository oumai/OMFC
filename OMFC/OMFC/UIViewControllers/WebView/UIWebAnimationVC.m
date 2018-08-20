//
//  UIWebAnimationVC.m
//  OMFC
//
//  Created by MichaeOu on 2018/8/20.
//  Copyright © 2018年 康美. All rights reserved.
//
#define AppColor        RGB(33,131,245)

#import "UIWebAnimationVC.h"
#import "WHAnimation.h"
#import <JavaScriptCore/JavaScriptCore.h>
@interface UIWebAnimationVC ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic,strong) UIView *hudView;

@end

@implementation UIWebAnimationVC


- (void)dealloc
{
    [_hudView removeFromSuperview];
    _hudView = nil;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self layoutSubpages];
    
    
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
}
#pragma mark -
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self showHUDView];
}

- (void)showHUDView
{
    [UIView animateWithDuration:0.3f animations:^{
        _hudView.alpha = 1.0f;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)dismissHUDView
{
    [UIView animateWithDuration:0.3f animations:^{
        _hudView.alpha = 0.0f;
    } completion:^(BOOL finished) {
        
    }];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self dismissHUDView];

}

#pragma mark - layout
- (void)layoutSubpages {
    
    [self.view addSubview:self.webView];
    
    [self.view addSubview: self.hudView];

    
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
        make.left.right.equalTo(@0);
    }];
    

}

- (UIWebView *)webView
{
    if (!_webView) {
        
        _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, CoreWidth, CoreHeight)];
        _webView.delegate = self;
        
    }
    return _webView;
}

- (UIView *)hudView
{
    if (!_hudView) {
        _hudView = [[UIView alloc]init];
        [_hudView.layer addSublayer: [WHAnimation replicatorLayer_Triangle:AppColor]];
        _hudView.center = CGPointMake((CoreWidth-50)/2, CoreHeight/2-50);
        _hudView.alpha = 0;
    }
    return _hudView;
}

@end
