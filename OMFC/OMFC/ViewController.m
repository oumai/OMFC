//
//  ViewController.m
//  OMFC
//
//  Created by Omichael on 2017/4/12.
//  Copyright © 2017年 康美. All rights reserved.
//
#pragma mark -------------------------------------------------------------------------------------------------Click------------------------------------------------------------
#pragma mark -------------------------------------------------------------------------------------------------DataSource、Delegate------------------------------------------------------------
#pragma mark -------------------------------------------------------------------------------------------------ConfigureUI------------------------------------------------------------


#define  LeftTableViewWidth 150
#define  LeftTableViewHeight self.view.frame.size.height
#define  RightTableViewWidth (self.view.frame.size.width - LeftTableViewWidth)


#import "ViewController.h"


/*
 ①
 所有控件
 */
#import "GDBViewController.h"
#import "CategoryViewController.h"
#import "HeighViewController.h"
#import "OMConfigNetVC.h"
/*
 ②
 */


/*
 ③
 */


/*
 ④
 
 */

/*
 ⑤
 */


/*
 ⑥
 */


/*
 ⑦
 */


/*
 ⑧
 */

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_rightTableView;
    UITableView *_leftTableView;
    NSArray *_leftTableSource;
    NSArray *_rightTableSource;
    NSArray *_proTimeList;
    NSArray *_proTitleList;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _leftTableSource = @[@"",
                         @"",
                         @"",
                         @"",
                         @"",
                         @"",
                         @"",
                         @""
                         ];
    
    
    _rightTableSource = @[@{@"header":@"",
                            @"title":@[@"GDBViewController",@"CategoryViewController",@"获取高度",@"OMConfigNetVC",@"",@"ff"]},
                          
                          @{@"header":@"",
                            @"title":@[@"",@"",@"",@"",@"",@""]},
                          
                          @{@"header":@"",
                            @"title":@[@"",@"",@"",@"",@"",@""]},
                          
                          @{@"header":@"",
                            @"title":@[@"",@"",@"",@"",@"",@""]},
                          
                          @{@"header":@"",
                            @"title":@[@"",@"",@"",@"",@"",@""]},
                          
                          @{@"header":@"",
                            @"title":@[@"",@"",@"",@"",@"",@""]},
                          
                          @{@"header":@"",
                            @"title":@[@"",@"",@"",@"",@"",@""]},
                          
                          @{@"header":@"",
                            @"title":@[@"",@"",@"",@"",@"",@""]}
                          
                          ];
    
    
    
    [self setupSomeParamars];
    
    
    
}
//创建两个tableview
- (void)setupSomeParamars
{
    _rightTableView = [[UITableView alloc] initWithFrame:CGRectMake(LeftTableViewWidth, 0, RightTableViewWidth, self.view.frame.size.height) style:UITableViewStyleGrouped];
    _rightTableView.dataSource = self;
    _rightTableView.delegate = self;
    [self.view addSubview:_rightTableView];
    
    
    
    _leftTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, LeftTableViewWidth, self.view.frame.size.height) style:UITableViewStyleGrouped];
    _leftTableView.dataSource = self;
    _leftTableView.delegate = self;
    [self.view addSubview:_leftTableView];
    
}
//添加表头
- (void)configureHeaderView
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,RightTableViewWidth, 60)];
    headerView.backgroundColor = [UIColor whiteColor];
    UILabel *titleLabel = [UILabel new];
    titleLabel.frame = headerView.frame;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"联动表";
    [headerView addSubview:titleLabel];
    _rightTableView.tableHeaderView = headerView;
    
}

//设置cell的显示
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseIdentifer = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifer];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifer];
    }
    if(tableView == _rightTableView){
        cell.textLabel.text = [_rightTableSource[indexPath.section] objectForKey:@"title"][indexPath.row];
    }else if (tableView == _leftTableView){
        cell.textLabel.text = _leftTableSource[indexPath.row];
    }
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (tableView == _rightTableView) {
        return 40;
    }else{
        return 50;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (tableView == _rightTableView) {
        return 0.001;
    }else
    {
        return 0.001;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == _rightTableView) {
        return _rightTableSource.count;
    }else{
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == _leftTableView) {
        return _leftTableSource.count;
    }else{
        return [[_rightTableSource[section] objectForKey:@"title"] count];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (tableView == _rightTableView) {
        return [_rightTableSource[section] objectForKey:@"header"];
    }else{
        return nil;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if(tableView == _rightTableView){
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-100, 40)];
        label.backgroundColor = [UIColor cyanColor];
        label.text = [_rightTableSource[section] objectForKey:@"header"];
        label.textColor = [UIColor redColor];
        return label;
    }else{
        return nil;
    }
}

/*
 联动效果在于这里
 这个方法不准确
 */
//- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
//{
//    if(tableView == _rightTableView){
//        [_leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:section inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];
//    }
//}


//MARK: - 一个方法就能搞定 右边滑动时跟左边的联动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    // 如果是 左侧的 tableView 直接return
    if (scrollView == _leftTableView) return;
    
    // 取出显示在 视图 且最靠上 的 cell 的 indexPath
    NSIndexPath *topHeaderViewIndexpath = [[_rightTableView indexPathsForVisibleRows] firstObject];
    
    // 左侧 talbelView 移动的 indexPath
    NSIndexPath *moveToIndexpath = [NSIndexPath indexPathForRow:topHeaderViewIndexpath.section inSection:0];
    
    // 移动 左侧 tableView 到 指定 indexPath 居中显示
    [_leftTableView selectRowAtIndexPath:moveToIndexpath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    
    if (_rightTableView == tableView) {
        /**/
        if (indexPath.section == 0) {
            
            if (indexPath.row == 0) {
                //GDB及打印
                GDBViewController *vc = [[GDBViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];

            }
            else if (indexPath.row == 1) {
                
                //category(筛选数字)
                CategoryViewController *vc = [[CategoryViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];

            }
            else if (indexPath.row == 2)
            {
                HeighViewController *vc = [HeighViewController new];
                [self.navigationController pushViewController:vc animated:YES];
            }
            else if (indexPath.row == 3)
            {
                OMConfigNetVC *vc = [OMConfigNetVC new];
                [self presentViewController:vc animated:YES completion:^{
                    
                }];
                //[self.navigationController pushViewController:vc animated:YES];
            }
            
        }
        /*
         */
        else if (indexPath.section == 1)
        {
            if (indexPath.row == 0) {
              
            }
            else if (indexPath.row == 1) {
                
                
            }
            else if (indexPath.row == 2) {
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
            
        }
        /*
         */
        
        else if (indexPath.section == 2)
        {
            if (indexPath.row == 0) {
                
                        }
            
        }
        /*
         UICollectionViews
         */
        else if (indexPath.section == 3)
        {
            if (indexPath.row == 0) {
                          }
            if (indexPath.row ==  1) {
                          }
        }
        /*弹框*/
        else if (indexPath.section == 4)
        {
             }
        
        /*手势*/
        else if (indexPath.section == 5)
        {
            
        }
        /*渐变*/
        
        else if (indexPath.section == 6)
        {
            
            
        }
        else if (indexPath.section == 7)
        {
            
            
        }
        
    }
    else if (tableView == _leftTableView)
    {
        //计算出右侧tableView将要滚动的位置
        NSIndexPath *moveToIndexPath = [NSIndexPath indexPathForRow:0 inSection:indexPath.row];
        //将右侧tableView移动到指定位置
        [_rightTableView selectRowAtIndexPath:moveToIndexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
        //取消选中效果
        [_rightTableView deselectRowAtIndexPath:moveToIndexPath animated:YES];
        
    }
    
}




@end
