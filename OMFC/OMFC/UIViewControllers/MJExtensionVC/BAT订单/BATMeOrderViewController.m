//
//  BATMeOrderViewController.m
//  OMFC
//
//  Created by MichaeOu on 2018/4/11.
//  Copyright © 2018年 康美. All rights reserved.
//

#import "BATMeOrderViewController.h"
#import "PharmacyOrderListModel.h"
#import "BATWillPayCell.h"
@interface BATMeOrderViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation BATMeOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setDataSource];
    
    
    [self.view addSubview:self.tableView];
}

- (void)setDataSource
{
    self.dataArray = [NSMutableArray array];
    NSDictionary *dict = @{
                           @"RecordsCount":@1,
                           @"PageIndex":@0,
                           @"PageSize":@10,
                           @"ResultCode":@0,
                           @"ResultMessage":@"操作成功",
                           @"Data":@[
                                   @{
                                       @"PayMethod":@0,
                                       @"OrderStatus":@1,
                                       @"OrderType":@0,
                                       @"ReceiveMethod":@0,
                                       @"AccountMobile":@"",
                                       @"OrderNo":@"978102139706544128",
                                       @"TrackingNumber":@"",
                                       @"TradeNo":@"",
                                       @"PayMethodVal":@"",
                                       @"OrderPayTime":@"0001-01-01 00:00:00",
                                       @"Address":@"",
                                       @"CreatedTime":@"2018-03-26 10:51:37",
                                       @"FetchCode":@"",
                                       @"FetchTime":@"0001-01-01 00:00:00",
                                       @"DrugStoreID":@"",
                                       @"MemberID":@"",
                                       @"RecipeID":@"",
                                       @"RecipeFileUrl":@"",
                                       @"Symptom":@"",
                                       @"Freight":@"",
                                       @"OrderMoney":@"",
                                       @"Receiver":@"",
                                       @"ReceiverMobile":@"",
                                       @"ReceiverAddress":@"",
                                       @"ProductList":@[
                                               @{
                                                   @"ProductID":@"5a9df94314ac45a397f14d478c8d5ca5",
                                                   @"ProductName":@"天麻素片",
                                                   @"ProductImage":@"http://i13.wkimg.com/itemyaobox/2015/08/03/55bf0a5e21b0b.jpg",
                                                   @"ProductPrice":@"0.01",
                                                   @"Specification":@"25mg×24’",
                                                   @"ManufactorName":@"昆明制药集团股份有限公司",

                                                   }
                                               
                                               
                                               ],

                                     
                                     },
                                   @{
                                       @"PayMethod":@0,
                                       @"OrderStatus":@1,
                                       @"OrderType":@0,
                                       @"ReceiveMethod":@0,
                                       @"AccountMobile":@"",
                                       @"OrderNo":@"978102139706544128",
                                       @"TrackingNumber":@"",
                                       @"TradeNo":@"",
                                       @"PayMethodVal":@"",
                                       @"OrderPayTime":@"0001-01-01 00:00:00",
                                       @"Address":@"",
                                       @"CreatedTime":@"2018-03-26 10:51:37",
                                       @"FetchCode":@"",
                                       @"FetchTime":@"0001-01-01 00:00:00",
                                       @"DrugStoreID":@"",
                                       @"MemberID":@"",
                                       @"RecipeID":@"",
                                       @"RecipeFileUrl":@"",
                                       @"Symptom":@"",
                                       @"Freight":@"",
                                       @"OrderMoney":@"",
                                       @"Receiver":@"",
                                       @"ReceiverMobile":@"",
                                       @"ReceiverAddress":@"",
                                       @"ProductList":@[
                                               @{
                                                   @"ProductID":@"5a9df94314ac45a397f14d478c8d5ca5",
                                                   @"ProductName":@"天麻素片",
                                                   @"ProductImage":@"http://i13.wkimg.com/itemyaobox/2015/08/03/55bf0a5e21b0b.jpg",
                                                   @"ProductPrice":@"0.01",
                                                   @"Specification":@"25mg×24’",
                                                   @"ManufactorName":@"昆明制药集团股份有限公司",
                                                   
                                                   }
                                               
                                               
                                               ],
                                       
                                       
                                       }
                                   
                                   
                                   ]

                           };
    
    
    PharmacyOrderListModel *model = [PharmacyOrderListModel mj_objectWithKeyValues:dict];
    [self.dataArray addObjectsFromArray:model.Data];
    [self.tableView reloadData];
}


- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.rowHeight = 122;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    BATWillPayCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[BATWillPayCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.drugListData = self.dataArray[indexPath.row];
    return cell;
}


@end
