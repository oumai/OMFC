//
//  ChildrenViewController.h
//  OMFC
//
//  Created by MichaeOu on 2018/4/8.
//  Copyright © 2018年 康美. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChildrenViewController : UIViewController

@property (nonatomic, strong) void(^popBlock)(NSArray *,NSString *);

@end
