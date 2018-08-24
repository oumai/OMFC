//
//  UpdateVersionVC.m
//  OMFC
//
//  Created by MichaeOu on 2018/8/22.
//  Copyright © 2018年 康美. All rights reserved.
//

#import "UpdateVersionVC.h"

@interface UpdateVersionVC ()

@end

@implementation UpdateVersionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self updateVersion];
    
    
}



- (void)updateVersion
{
    
    //获得上线版本号
    NSString *string = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"https://itunes.apple.com/cn/lookup?id=1397336570"] encoding:NSUTF8StringEncoding error:nil];
    
    if (!string) {
        return;
    }
    
    
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableLeaves) error:nil] ;
    
    NSString *upString = [[[dic objectForKey:@"results"] firstObject] objectForKey:@"version"];
    NSString *upNumber = [upString stringByReplacingOccurrencesOfString:@"." withString:@""];
    NSLog(@"dic = %@",dic);
    
    //获得当前版本
    NSString *currentVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    NSString *currentNumber = [currentVersion stringByReplacingOccurrencesOfString:@"." withString:@""];
    NSLog(@"%@",currentVersion);
    
    if (upNumber && [upNumber integerValue] > [currentNumber integerValue]) {
        
        
    }
    
}


@end
