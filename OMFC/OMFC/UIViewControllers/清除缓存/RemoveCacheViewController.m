//
//  RemoveCacheViewController.m
//  OMFC
//
//  Created by MichaeOu on 2018/5/7.
//  Copyright © 2018年 康美. All rights reserved.
//

#import "RemoveCacheViewController.h"

@interface RemoveCacheViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    CGFloat cacheSize;

}

@property (nonatomic, strong) UITableView *tableView;
@end

@implementation RemoveCacheViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.tableView];
    
}



- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
    }
    
    return _tableView;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifier"];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"identifier"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%.2fM",cacheSize];;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self removeCacheSDirectory]; //清除缓存
}
#pragma mark -
- (void)removeCacheSDirectory
{
    dispatch_async (dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),^{
        //
        NSString  *cachPath = [ NSSearchPathForDirectoriesInDomains ( NSCachesDirectory, NSUserDomainMask ,YES) objectAtIndex: 0 ];
        NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachPath];
        //        NSLog ( @"files :%li" ,[files count]);
        for ( NSString *p in files) {
            NSError *error;
            NSString *path = [cachPath  stringByAppendingPathComponent :p];
            if ([[ NSFileManager defaultManager ]  fileExistsAtPath :path]) {
                [[ NSFileManager defaultManager ]  removeItemAtPath :path  error :&error];
            }
        }
        [ self performSelectorOnMainThread : @selector (clearCacheSuccess)  withObject : nil waitUntilDone : YES ];
    });
}

-(void)clearCacheSuccess
{
    cacheSize = [self filePath];
    [self.tableView reloadData];
    NSLog(@"缓存已清除");
}

- (long long)fileSizeAtPath:(NSString *)filePath
{
    NSFileManager * manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath :filePath]){
        return [[manager attributesOfItemAtPath:filePath error: nil]fileSize];
    }
    return 0;
}

-(float)folderSizeAtPath:(NSString *)folderPath
{
    NSFileManager * manager = [ NSFileManager defaultManager];
    if (![manager fileExistsAtPath :folderPath]) return 0 ;
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath :folderPath] objectEnumerator];
    NSString * fileName;
    long long folderSize = 0 ;
    while ((fileName = [childFilesEnumerator nextObject ]) != nil ){
        NSString * fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        folderSize += [self fileSizeAtPath:fileAbsolutePath];
    }
    return folderSize/( 1024.0 * 1024.0 );
}

- (float)filePath
{
    NSString * cachPath = [ NSSearchPathForDirectoriesInDomains ( NSCachesDirectory , NSUserDomainMask , YES ) firstObject ];
    return [ self folderSizeAtPath :cachPath];
}


@end
