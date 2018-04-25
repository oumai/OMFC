//
//  NSArrayVC.m
//  OMFC
//
//  Created by MichaeOu on 2018/4/3.
//  Copyright © 2018年 康美. All rights reserved.
//

#import "NSArrayVC.h"
#import "Person.h"
@interface NSArrayVC ()

@end

@implementation NSArrayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //数组以及字符串
    [self arrayAndString];
    
    //遍历
    [self arrayForIn];
    
    //数组调用方法
    [self arrayFunc];
    
    //排序
    [self arraySort];
    
    
    //文件读写
    [self arrayWrite];
    
    //数组中数字小于多少
    [self compareNumber];
}

- (void)compareNumber
{
    NSArray *array = @[@0,@1,@2,@3,@4,@5];
    
    __block NSInteger count = 0;
    
    
    [array enumerateObjectsUsingBlock:^(NSNumber *number, NSUInteger idx, BOOL * _Nonnull stop) {
        
        //有多少个小于2的数
        if ([number compare:@6] == NSOrderedAscending) {
            count++;
        }
    }];
    
    NSLog(@"count = %ld",count);
}


- (void)arrayWrite
{
    
    NSArray *array = @[@"Sunny",@"Michael",@"Pony",@"Siman"];

    BOOL flag = [array writeToFile:@"/Users/xinhuakangmei/Desktop/abc.text" atomically:YES];
    NSLog(@"%i",flag);
}

- (void)arraySort
{
    Person *m0 = [Person new];
    m0.age = 7;

    Person *m1 = [Person new];
    m1.age = 10;

    Person *m2 = [Person new];
    m2.age = 13;

    Person *m3 = [Person new];
    m3.age = 5;

    
    NSLog(@"%p,%p,%p,%p",m0,m1,m2,m3);
    
    NSArray *array = @[m0,m1,m2,m3];

    
    
    NSArray *newArray = [array sortedArrayWithOptions:NSSortStable usingComparator:^NSComparisonResult(Person  *obj1, Person  *obj2) {

        
        NSLog(@"%ld",obj1.age);
        return obj1.age > obj2.age;

    }];
    
    NSArray *newArr = [@[@13,@15,@5,@7] sortedArrayUsingSelector:@selector(compare:)];

    
    NSArray *newA = [@[@13,@15,@5,@7] sortedArrayWithOptions:NSSortStable usingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
       
        
        return obj1>obj2;
    }];
    
    NSLog(@"newArr = %@,newArray = %@,newA = %@",newArr,newArray,newA);
}


- (void)arrayFunc
{
    
    Person *m0 = [Person new];
    Person *m1 = [Person new];
    Person *m2 = [Person new];
    Person *m3 = [Person new];
    NSArray *array = @[m0,m1,m2,m3];
    
    //不带参数
    [array makeObjectsPerformSelector:@selector(say)];
    
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        //不带参数
        [obj say];
        
        //带多个参数
        [obj say:@"666" doSomething:@"777"];
        
        if(idx == 1 )
        {
            *stop = YES;
        }
    }];
    
    //带一个参数
    [array makeObjectsPerformSelector:@selector(say:) withObject:@"666"];
    
    
}

- (void)arrayForIn
{
    NSArray *array = @[@"Sunny",@"Michael",@"Pony",@"Siman"];

    
    for (int i = 0; i<array.count; i++)
    {
        NSLog(@"0 = %@",array[i]);
    }
    
    for (NSString *obj in array) {
        
        NSLog(@" 1 = %@",obj);
    }
    
    
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSLog(@"  2 = %@",obj);
        
    }];
    
    
    [array enumerateObjectsWithOptions:(NSEnumerationConcurrent) usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        
        NSLog(@"   3 = %@",obj);

    }];
    
    
  
}

- (void)arrayAndString
{
    NSArray *array = @[@"Sunny",@"Michael",@"Pony",@"Siman"];
    NSString *string = [array componentsJoinedByString:@"*"];
    
    NSLog(@"%@",string);
    
    NSArray *arr = [string componentsSeparatedByString:@"*"];
    
    
    NSLog(@"%@",arr);
}

@end
