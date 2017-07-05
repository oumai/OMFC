//
//  ViewController.h
//  OMFC
//
//  Created by Omichael on 2017/4/12.
//  Copyright © 2017年 康美. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum
{
    //以下是枚举成员
    TestA = 0,
    TestB,
    TestC,
    TestD
}Test;//枚举名称

typedef NS_ENUM(NSInteger, Test1)
{
    //以下是枚举成员
    Test1A = 0,
    Test1B = 1,
    Test1C = 2,
    Test1D = 3
};
@interface ViewController : UIViewController

@property (nonatomic, assign) Test1 te;
@end

