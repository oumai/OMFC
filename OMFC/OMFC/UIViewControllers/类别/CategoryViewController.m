//
//  CategoryViewController.m
//  OMFC
//
//  Created by Omichael on 2017/4/12.
//  Copyright © 2017年 康美. All rights reserved.
//

#import "CategoryViewController.h"
#import "NSString+Number.h"   //
#import "NSArray+Log.h"       //数组打印汉字
#import "NSDictionary+Log.h" //字典打印汉字
#import "NSString+Contain.h" //字符串的包含关系
@interface CategoryViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *titleArray;

@end

@implementation CategoryViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];
    
    
    self.titleArray = [[NSMutableArray alloc] initWithObjects:@"筛选数字",@"打印数组中的汉字",@"包含",@"", nil];
    
   
    
#if DEBUG
    NSLog(@"DEBUG");
#else
    NSLog(@"RELEASE");

#endif
}
#pragma mark ------------------------------------------------------------------UITableViewDatasource Delegate-------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = self.titleArray[indexPath.row];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        
        [self configureNumber];  //筛选数字
    }
    else if (indexPath.row == 1)
    {
        [self configureHans];   //打印数组中的汉字
    }
    else if (indexPath.row == 2)
    {
        [self ];
    }
    else if (indexPath.row == 3)
    {
        
    }
    else if (indexPath.row == 4)
    {
        
    }
    else if (indexPath.row == 5)
    {
        
    }
    else if (indexPath.row == 6)
    {
        
    }
    else if (indexPath.row == 7)
    {
        
    }
}
#pragma mark -------------------------------------------------------------------------------------------------ConfigurePrintf------------------------------------------------------------

- (void)configureNumber
{
    NSString *str = @"asdfg1err2kjkj3kjklj4jn5j6k78";
    
    
    //筛选多少个数字的总和
    NSUInteger  count =  [NSString countWithString:str];
    //筛选出的数字拼接字符串
    NSString *string = [NSString numberWithString:str];
    NSLog(@"count = %li string = %@ ",(long)count,string);
    
    
    //没有传参
    NSUInteger  countNo = [str countWithString];
    
    NSLog(@"countNo = %ld",countNo);
    
}
#pragma mark -------------------------------------------------------------------------------------------------ConfigurePrintf------------------------------------------------------------

- (void)configureHans
{
    NSArray *array = @[@"深圳",@"上海",@"北京",@"武汉",@"广州",@"重庆",@"天津",@"杭州"];
    NSLog(@"array = %@",array);
    
    
    NSDictionary *dic = @{@"0":@"你可以",@"1":@"你真行"};
    NSLog(@"%@",dic);
}

#pragma mark -------------------------------------------------------------------------------------------------ConfigureContain------------------------------------------------------------

- (void)configureContain
{
    NSString *str1 = @"abcd";
    
    NSString *str2 = @"123";
    
    if ([str1 containsString:str2]) {
        NSLog(@"包含");
    }else{
        NSLog(@"不包含");
    }

}

@end
