//
//  GDBViewController.m
//  OMFC
//
//  Created by Omichael on 2017/4/12.
//  Copyright © 2017年 康美. All rights reserved.
//
#pragma mark -------------------------------------------------------------------------------------------------Click------------------------------------------------------------
#pragma mark -------------------------------------------------------------------------------------------------DataSource、Delegate------------------------------------------------------------
#pragma mark -------------------------------------------------------------------------------------------------configureUI------------------------------------------------------------

#import "GDBViewController.h"

@interface GDBViewController ()

@end

@implementation GDBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    /*
     打印
     */
   
    [self configurePrintf];
}
#pragma mark -------------------------------------------------------------------------------------------------ConfigurePrintf------------------------------------------------------------

- (void)configurePrintf
{
    
    /*
     常用的打印
     */
    NSLog(@"wocaoni");
    printf("nicaowo");
    NSLog(@"__func__ = %s",__func__);
    
    //指针打印、内存地址打印
    NSLog(@"%p",self);
    
    
    //保留小数点后面几位数，四舍五入
    float a = 1.933;   float b = 1.955;
    NSLog(@"a = %0.2f  b = %0.2f",a,b);
    
    //打印Frame
    CGRect frame = CGRectMake(10, 10, 10, 10);
    NSLog(@"%@", NSStringFromCGRect(frame));

    //换行打印
    NSLog(@"\n如果这就是爱情\n我也不会放弃");
    
    /*
     NSLog(@"%@",NSStringFromCGRect(pickerView.frame));
     
     或者
     CFShow(NSStringFromCGRect(pickerView.frame));
     
     输出NSRange
     NSLog(@"%@",NSStringFromRange(NSRange range)
     );
     
     打印 CGSize ：
     NSLog(@"%@",NSStringFromCGSize(someCG Size ));
     
     NSLog的格式如下所示：
     %@ 对象
     %d, %i 整数
     %hi 短整型
     %lli 长整型
     %u   无符整形
     %f 浮点/双字
     %0.2f  精度浮点数,且只保留两位小数
     %x, %X 二进制整数
     %o 八进制整数
     %zu size_t
     %p 指针
     %e   浮点/双字 （科学计算）
     %g   浮点/双字  科学技术法(用最简短的方式)
     %s C （char*）字符串
     %.*s Pascal字符串
     %c 字符
     %C unichar
     %lld 64位长整数（long long）
     %llu   无符64位长整数
     %Lf 64位双字
     %lu   sizeof(i)内存中所占字节数
     还有类似某些对象，例如CGRect，CGSize等
     打印CGRect ：
     NSLog(@"%@",NSStringFromCGRect(someCGRect));
     打印 CGSize ：
     NSLog(@"%@",NSStringFromCGSize(someCG Size ));
*/
}
#pragma mark -------------------------------------------------------------------------------------------------ConfigurePrintf------------------------------------------------------------

- (void)configureLLDB
{
    /*po
     *
     *po是print-object的简写，可用来打印所有NSObject对象
     *po [self view]
     */
    
    
    /*p
     *
     *p是print的简写，可用来打印所有NSObject对象
     *p (CGSize)[[self view] size]
     */
    
    
    
    /*call
     *
     *call即是调用的意思。其实上述的po和p也有调用的功能。因此一般只在不需要显示输出，或是方法无返回值时使用call。
     *call (void)[[self view]sizeToFit]     call (void)[[self view] size]
     */
    
    
    
    for (int i = 0; i<100; i++) {
        
        NSLog(@"n =   %i",i);
        
        
    }
    
    NSString *str = @"abc";
    
    
    if ([str isEqualToString:@"123"]) {
        
    }

}

@end
