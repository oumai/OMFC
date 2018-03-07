
//
//  URLViewConrtroller.m
//  OMFC
//
//  Created by MichaeOu on 2018/3/5.
//  Copyright © 2018年 康美. All rights reserved.
//



#import "URLViewConrtroller.h"
#import "Tools.h"
#import "OMJSObject.h"

#import <JavaScriptCore/JavaScriptCore.h>

@interface URLViewConrtroller ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) JSContext *context;
@property (nonatomic, assign) BOOL isNeedLoad;
@end

@implementation URLViewConrtroller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.isNeedLoad = YES;

    [self.view addSubview:self.webView];
    
}
- (void)back:(UIBarButtonItem *)btn
{
    if ([self.webView canGoBack]) {
        [self.webView goBack];
    }
    else
    {
        [self.view resignFirstResponder];
        [self.navigationController popViewControllerAnimated:YES];
    }
}


#pragma mark -webViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {

    return YES;
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    self.context = [self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    OMJSObject *jsObject = [[OMJSObject alloc] init];
    self.context[@"HealthBAT"] = jsObject;
    
    WEAK_SELF(self);
    //返回首页
    [jsObject setGoToBatHomeBlock:^{
        STRONG_SELF(self);
        dispatch_async(dispatch_get_main_queue(), ^{
            
//            if (self.isFromRoundGuide) {
//                BATAppDelegate *appDelegate = (BATAppDelegate *)[UIApplication sharedApplication].delegate;
//                [appDelegate.window.rootViewController presentViewController:appDelegate.navHomeVC animated:NO completion:nil];
//            }
//            else
            {
                //[self.tabBarController setSelectedIndex:0];
                [self.navigationController popViewControllerAnimated:YES];
            }
            
        });
    }];
    
}


//无参数的方法
- (void)methond {
    NSLog(@"调用无参数的方法");
    
}

//有参数的方法
- (void)methondParam:(NSString *)str1 withStr:(NSString *)str2 {
    NSLog(@"str1 = %@, str2 = %@", str1, str2);
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self prefersStatusBarHidden];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
    if (self.isNeedLoad == NO) {
        return;
    }
    [self loadURL:5];
    self.isNeedLoad = NO;
}

- (BOOL)prefersStatusBarHidden{
    
    return YES;
}
- (void)loadURL:(NSInteger)integer
{
    
    if (integer == 0) {
        
        NSString *stringUrl = nil;
        NSString *baiDuURLString = nil;
        baiDuURLString = @"http://www.baidu.com";
        
        NSString *documentString = nil;
        documentString = @"http://mobile.hmtest.kmhealthcloud.cn:8165?appkey=e38ad4f48133c76ad8e6165ccc427211&timestamp=2018-03-05 17:42:19&sign=a0cd47c12a97ec03c9982daf30fde9b1&phone=15013769520&src=2";
        
        
        stringUrl = baiDuURLString; //赋值
        
        stringUrl = [stringUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:stringUrl]]];
    }
    else
    {
        NSString *KM_HEALTH360_URL = @"http://djymbgl.kmhealthcloud.com:9003";
        
        NSString *appkey = @"e38ad4f48133c76ad8e6165ccc427211";
        NSString *appSecret = @"dbf2dcc52133c76ad8e61600eeafa583";
        NSString *timestamp = [Tools getDateStringWithDate:[NSDate date] Format:@"yyyy-MM-dd HH:mm:ss"];//当前日期
        NSString *phone = @"17688715132";//person.Data.PhoneNumber;//手机号
        
        NSArray *array = @[appkey,appSecret,timestamp];
        
        array = [array sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            return [obj1 compare:obj2];
        }];
        
        NSString *tmpSign = @"";
        for (NSString *string in array) {
            tmpSign = [tmpSign stringByAppendingString:string];
        }
        
        NSString *sign = [Tools md5String:tmpSign];
        
        NSString *url = [NSString stringWithFormat:@"%@?appkey=%@&timestamp=%@&sign=%@&phone=%@&src=2",KM_HEALTH360_URL,appkey,timestamp,sign,phone];
        
        
        
        url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        
        
        NSLog(@"Encodingurl= %@",url);
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
        
    }
   
}

- (UIWebView *)webView
{
    
    if(!_webView)
    {
        _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, CoreWidth, CoreHeight)];
        _webView.backgroundColor = [UIColor whiteColor];
        _webView.delegate = self;
        
    }
    return _webView;
}
@end
