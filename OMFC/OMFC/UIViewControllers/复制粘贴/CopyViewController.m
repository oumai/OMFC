//
//  CopyViewController.m
//  OMFC
//
//  Created by MichaeOu on 2017/7/7.
//  Copyright © 2017年 康美. All rights reserved.
//

#import "CopyViewController.h"

@interface CopyViewController ()

@end

@implementation CopyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITextField *textField = [[UITextField alloc] init];
    textField.frame = CGRectMake(100, 100, 200, 60);
    textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:textField];
    
    //系统级别
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = textField.text;
    //NSLog(@"\r\n====>输入框内容为:%@\r\n====>剪切板内容为:%@",textField.text);
    
    
//    //识别剪贴板中的内容
//    if let paste = UIPasteboard.generalPasteboard().string where
//        (paste.hasPrefix("http://") || paste.hasPrefix("https://")) {
//            //如果剪贴板中的内容是链接
//            let alert = UIAlertController(title: "要打开剪贴板中的链接吗？",
//                                          message: nil,
//                                          preferredStyle: UIAlertControllerStyle.Alert)
//            alert.addAction(UIAlertAction(title: "打开",
//                                          style: UIAlertActionStyle.Default,
//                                          handler: { Void in
//                                              // your implementation
//                                              print(paste)
//                                          }))
//            alert.addAction(UIAlertAction(title: "忽略",
//                                          style: UIAlertActionStyle.Cancel,
//                                          handler: nil))
//            //弹出Alert
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            if let vc = storyboard.instantiateViewControllerWithIdentifier("navi") as? UINavigationController {
//                self.window?.rootViewController = vc
//                vc.presentViewController(alert, animated: true, completion: nil)
//            }
//        }
    
    
    [[UIPasteboard generalPasteboard] setPersistent:YES];
    [[UIPasteboard generalPasteboard] setValue:@"" forPasteboardType:[UIPasteboardTypeListString objectAtIndex:0]];
}
@end
