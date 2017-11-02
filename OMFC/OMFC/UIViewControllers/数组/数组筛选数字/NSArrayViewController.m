//
//  NSArrayViewController.m
//  OMFC
//
//  Created by MichaeOu on 2017/11/2.
//  Copyright © 2017年 康美. All rights reserved.
//

#import "NSArrayViewController.h"

@interface NSArrayViewController ()
@property (nonatomic, assign) BOOL isYes;
@end

@implementation NSArrayViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    [self firstVoid];
    [self secondVoid];
    

    [self thirdVoid]; //判断YES
    
    
   
}

- (void)firstVoid
{
    
    
    NSArray *array = @[@"2",@"3",@"4"];
    
    
    NSMutableArray *tempArray = [NSMutableArray array];
    [tempArray addObjectsFromArray:@[@"2",@"3",@"4",@"5",@"6"]];
    
    
    NSPredicate *filterArray = [NSPredicate predicateWithFormat:@"NOT (SELF IN %@)",array];
    NSArray *filtered = [tempArray filteredArrayUsingPredicate:filterArray];
    
    NSLog( @"\ntempArray = %@ \nfilterArray= %@ \nfiltered = %@",tempArray,filterArray,filtered);
    
    
    
    //
    if ([filtered containsObject:@5] == YES)
    {
        NSLog(@"包含");
    }
    else
    {
        NSLog(@"不包含");
    }
    //nsnumber
    if ([filtered containsObject:[NSNumber numberWithInt:5]] == YES)
    {
        NSLog(@"包含");
    }
    else
    {
        NSLog(@"不包含");

    }
    
    
    //字符串
    if([filtered containsObject:@"5"] == YES)
    {
        NSLog(@"包含");
    }
    else
    {
        NSLog(@"不包含");
    }
       
             
    
}
- (void)secondVoid
{
    NSMutableArray *firstArray = [NSMutableArray array];
    [firstArray addObject:@2];
    
    NSMutableArray *tempArray = [NSMutableArray array];
    [tempArray addObjectsFromArray:@[@2,@3,@4,@5,@6]];

    
    NSPredicate *filterArray = [NSPredicate predicateWithFormat:@"NOT (SELF IN %@)",firstArray];
    NSArray *filtered = [tempArray filteredArrayUsingPredicate:filterArray];
    
    NSLog( @"\ntempArray = %@ \nfilterArray= %@ \nfiltered = %@",tempArray,filterArray,filtered);
    
    //
    if ([filtered containsObject:@5])
    {
        NSLog(@"包含");
    }
    else
    {
        NSLog(@"不包含");
    }
    
    //nsnumber
    if ([filtered containsObject:[NSNumber numberWithInt:5]])
    {
        NSLog(@"包含");
    }
    else
    {
        NSLog(@"不包含");
    }
    
    
    //字符串
    if([filtered containsObject:@"5"])
    {
        NSLog(@"包含");
    }
    else
    {
        NSLog(@"不包含");
    }
    
}

- (void)thirdVoid
{
    self.isYes = YES;
    
    if(_isYes)
    {
        if (_isYes == YES) {
            NSLog(@"_isYes = %@",_isYes?@"YES":@"NO");
        }
    }
}

@end
