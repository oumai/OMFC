//
//  UIWebViewController.m
//  OMFC
//
//  Created by MichaeOu on 2018/8/20.
//  Copyright © 2018年 康美. All rights reserved.
//

/*
 ①三种加载WebView是的动画。
 ②清楚缓存。
 ③加载本地的index.html
 ④WKWebView中联合JS调试
 ⑤WK页面UI错乱，
 ⑥WKWebView的加载机制
 */

#import "UIWebViewController.h"

@interface UIWebViewController ()<UIWebViewDelegate>
{
    NSURLConnection *theConnection;

}
@property (nonatomic, strong) UIWebView *webView;

@property (nonatomic,strong) UIImageView *animateView;
@property (nonatomic,strong) UIView *loadingView;
@end

@implementation UIWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self.animateView startAnimating];
    [self layoutSubpages];
    
    
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:(NSURLRequestReloadIgnoringLocalCacheData) timeoutInterval:2];
    
    [self.webView loadRequest:request];
    
    if (theConnection)
    {
        [theConnection cancel];
        // SAFE_RELEASE(theConnection);
        NSLog(@"safe release connection");
    }
    theConnection= [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:YES];
    
   
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{


    if (theConnection) {
        //  SAFE_RELEASE(theConnection);
        NSLog(@"safe release connection");
    }
    
    if ([response isKindOfClass:[NSHTTPURLResponse class]]){
        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
        if ((([httpResponse statusCode]/100) == 2)){
            NSLog(@"connection ok");
        }
        else{
            NSError *error = [NSError errorWithDomain:@"HTTP" code:[httpResponse statusCode] userInfo:nil];
            if ([error code] == 404){
                NSLog(@"404");
                [self webViewFail];
            }
            else if ([error code] == 403){
                NSLog(@"403");
                [self webViewFail];
            }
        }
    }
}
- (void)webViewFail
{
    UILabel *content = [[UILabel alloc]initWithFrame:(CGRectMake(20, 100, 300, 100))];
    
    NSString *originStr = @"Hello,中秋节！";
    NSMutableAttributedString *attributedStr01 = [[NSMutableAttributedString alloc] initWithString: originStr];
    [attributedStr01 addAttribute: NSForegroundColorAttributeName value: [UIColor blueColor] range: NSMakeRange(0, 4)];
    //分段控制，第5个字符开始的3个字符，即第5、6、7字符设置为红色
    [attributedStr01 addAttribute: NSForegroundColorAttributeName value: [UIColor redColor] range: NSMakeRange(4, 3)];
    
    //赋值给显示控件label01的 attributedText
    content.attributedText = attributedStr01;
    [self.view addSubview:content];
    
    
    // 这里为加载静态页面，进行展示错误信息
    //   UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    //   NSString *path = [[NSBundle mainBundle] bundlePath];
    //   NSURL *baseURL = [NSURL fileURLWithPath:path];
    //    NSString * htmlPath = [[NSBundle mainBundle] pathForResource:@"webError" ofType:@"html"];
    //    NSString * htmlCont = [NSString stringWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:nil];
    //    [webView loadHTMLString:htmlCont baseURL:baseURL];
    //  [self.view addSubview: webView];
    //     JS 调用 OC
    //     1、首先导入库 JavaScriptCore.framework
    //   JSContext *context = [webView  valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    //   context[@"btnSubmit"] = ^() {
    //    NSLog(@"返回上一页");
    //  };
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    if (theConnection) {
        //  SAFE_RELEASE(theConnection);
        NSLog(@"safe release connection");
        [self webViewFail];
    }
    if (error.code == 22) //The operation couldn’t be completed. Invalid argument
    {
        NSLog(@"22");
        [self webViewFail];
    }
    else if (error.code == -1001) //The request timed out.  webview code -999的时候会收到－1001
    {
        NSLog(@"-1001");
        [self webViewFail];
    }
    else if (error.code == -1005) //The network connection was lost.
    {
        NSLog(@"-1005");
        [self webViewFail];
    }
    else if (error.code == -1009) //The Internet connection appears to be offline
    {
        NSLog(@"-1009");
        [self webViewFail];
    }
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    /*
     didFailLoadWithError中出现code ＝ -999错误。
     错误原因：一个页面没有被加载完成之前，收到下一个请求。
     */
    NSLog(@"error%@",error);
    
    if ([error code] == NSURLErrorCancelled) {
        return;
    }
    
    [self webViewFail];
}



-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.animateView stopAnimating];
    [self.loadingView removeFromSuperview];
}

#pragma mark - layout
- (void)layoutSubpages {
    
    [self.view addSubview:self.webView];
    [self.view addSubview:self.loadingView];
    [self.loadingView addSubview:self.animateView];
    
    WEAK_SELF(self);
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
        make.left.right.equalTo(@0);
    }];

    [self.loadingView mas_makeConstraints:^(MASConstraintMaker *make) {
        STRONG_SELF(self);
        make.edges.equalTo(self.view);
    }];
    
    [self.animateView mas_makeConstraints:^(MASConstraintMaker *make) {
        STRONG_SELF(self);
        make.center.equalTo(self.loadingView);
        make.size.equalTo(CGSizeMake(80, 80));
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



- (UIView *)loadingView
{
    if (_loadingView == nil) {
        _loadingView = [[UIView alloc] init];
        _loadingView.backgroundColor = [UIColor whiteColor];
        
    }
    return _loadingView;
}

- (UIImageView *)animateView
{
    if (_animateView == nil) {
        _animateView = [[UIImageView alloc] init];
        _animateView.bounds = CGRectMake(0, 0, 40, 40);
        [_animateView setImage:[UIImage imageNamed:@"加载1"]];
        [_animateView sizeToFit];
        
        NSMutableArray *animates = [NSMutableArray array];
        
        for (int i = 1; i < 21; i++) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"加载%ld",(long)i]];
            [animates addObject:image];
        }
        _animateView.animationDuration = 0.8;
        _animateView.animationImages = animates;
    }
    return _animateView;
}
@end
