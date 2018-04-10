//
//  HeighViewController.m
//  OMFC
//
//  Created by MichaeOu on 2017/7/4.
//  Copyright © 2017年 康美. All rights reserved.
//
#define CustomCellID @"UITableViewCellID"
static NSString *string = @"如果我能看得见就能轻易的分辨白天黑夜，就能在人群中牵住你的手，如果我能看得见就能驾车带你到处遨游，就能轻易的从背后给你一个拥抱，如果我能看得见，";
#import "HeighViewController.h"
#import "HeighCustomCell.h"

@interface HeighViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation HeighViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.tableView];
}


-(UITableView *)tableView {
    
    
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
        _tableView.backgroundColor = BASE_BACKGROUND_COLOR;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
        [_tableView registerClass:[HeighCustomCell class] forCellReuseIdentifier:CustomCellID];
    }
    return _tableView;
}

#pragma mark ------------------------------------------------------------------UITableViewDatasource Delegate-------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    HeighCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CustomCellID];
    if (nil == cell) {
        cell = [[HeighCustomCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:CustomCellID];
        
        
        [cell setCellBlock:^{
            
            
        }];
    }
    cell.detailLabel.text = string;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [HeighCustomCell heightForCellWithString:string];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
@end
