//
//  ARCAndMrcViewController.m
//  OMFC
//
//  Created by kmom on 2018/9/13.
//  Copyright © 2018年 康美. All rights reserved.
//

#import "ARCAndMrcViewController.h"

@interface ARCAndMrcViewController ()

@end

@implementation ARCAndMrcViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //判断ARC和MRC
    
#ifndef MB_STRONG
    
#if __has_feature(objc_arc)
#define MB_STRONG strong
    
    
    NSLog(@"ARC");
#else
    
    
    NSLog(@"MRC");
    
#define MB_STRONG retain
#endif
#endif
    
    
    
    
    
#if __has_feature(objc_arc)
    
    NSLog(@"ARC");
    
    
#else
    
    NSLog(@"MRC");
    
    
#endif
}

 

@end
