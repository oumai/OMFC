//
//  BlockViewController.m
//  OMFC
//
//  Created by MichaeOu on 2018/4/8.
//  Copyright © 2018年 康美. All rights reserved.
//

#import "BlockViewController.h"
#import "ChildrenViewController.h"

#import "SampleObject.h"
@interface BlockViewController ()

@property (nonatomic, strong) UINavigationController *naviVC;
@property (nonatomic, strong) SampleObject *sample;
@end

@implementation BlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self voidStrong];  //强引用
    //[self voidWeak];    //弱引用
    
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button.selected = YES;
    [button setFrame:CGRectMake(100, 100, 100, 100)];
    [button setBackgroundColor:[UIColor cyanColor]];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)buttonClick
{
    ChildrenViewController *vc = [[ChildrenViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
 
    WEAK_SELF(self)
    [vc setPopBlock:^(NSArray *arr, NSString *string) {

        STRONG_SELF(self)
        self.view.backgroundColor = [UIColor whiteColor];
        NSLog(@"arr = %@,string = %@",arr,string);

    }];
    
        
}


- (void)voidStrong
{
    
    
    SampleObject* sample = [[SampleObject alloc]init];
    
    self.sample= sample;
    
    __weak SampleObject* weaksample = sample;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), ^{
        
        NSInteger count =0;
        
        __strong SampleObject* strongsample = weaksample;
        while(count<10) {
            
            count++;
            
            NSLog(@"aaa %@",strongsample);
            
            sleep(1);
            
        }
        
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3*NSEC_PER_SEC)),dispatch_get_main_queue(), ^{
        
        self.sample = nil;
        
    });
}

- (void)voidWeak
{
    SampleObject* sample = [[SampleObject alloc]init];
    
    self.sample= sample;
    
    __weak SampleObject* weaksample = sample;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), ^{
        
        NSInteger count =0;
        
        //__strong SampleObject* strongsample = weaksample;
        
        while(count<10) {
            
            count++;
            
            NSLog(@"aaa %@",weaksample);
            
            sleep(1);
            
        }
        
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3*NSEC_PER_SEC)),dispatch_get_main_queue(), ^{
        
        self.sample = nil;
        
    });
}

@end
