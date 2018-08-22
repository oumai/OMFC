//
//  GCDViewController.m
//  OMFC
//
//  Created by MichaeOu on 2018/8/21.
//  Copyright © 2018年 康美. All rights reserved.
//

/*
 
 
 https://www.jianshu.com/p/2dd000a8f072
 一、pthreads
 二、NSThread
 
 三、NSOperation和NSOperationQueue
 
 
 */

#import "GCDViewController.h"

@interface GCDViewController ()

@end

@implementation GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    
    
    //[self thread1];
    //[self thread2];
    //[self thread3];
    //[self nsinvocation1];
    [self NSBlockOperation];
    
}

- (void)NSBlockOperation
{
    NSBlockOperation *blockOperation = [[NSBlockOperation alloc] init];
    
    [blockOperation addExecutionBlock:^{
        NSLog(@"block 1 in thread:%@",[NSThread currentThread]);
    }];
    
    [blockOperation addExecutionBlock:^{
        NSLog(@"block 2 in thread:%@",[NSThread currentThread]);

    }];
    
    [blockOperation addExecutionBlock:^{
        NSLog(@"block 3 in thread:%@",[NSThread currentThread]);
    }];
    [blockOperation addExecutionBlock:^{
        NSLog(@"block 4 in thread:%@",[NSThread currentThread]);
    }];
    [blockOperation addExecutionBlock:^{
        sleep(1);
        NSLog(@"block 5 in thread:%@",[NSThread currentThread]);
    }];
    [blockOperation start];
    NSLog(@"123");
    
   
}

- (void)nsinvocation1
{
    NSInvocationOperation *invo = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(test:) object:nil];
    [invo start];
    NSLog(@"111");
}

- (void)thread1
{
    // 1. 创建线程
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(test:) object:nil];
    thread.name = @"thread1";
    [thread start];// 2. 启动线程，此方法需要我们手动开启线程
}
- (void)thread2
{
    [NSThread detachNewThreadSelector:@selector(test:) toTarget:self withObject:@"分离子线程"];
}

- (void)thread3
{
    [self performSelectorInBackground:@selector(test:) withObject:@"后台线程"];
}

- (void)test:(NSString *)string {
    NSLog(@"test - %@ - %@", [NSThread currentThread], string);
}

@end
