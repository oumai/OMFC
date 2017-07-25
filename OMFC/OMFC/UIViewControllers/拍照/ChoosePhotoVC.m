//
//  ChoosePhotoVC.m
//  OMFC
//
//  Created by MichaeOu on 2017/7/18.
//  Copyright © 2017年 康美. All rights reserved.
//

#import "ChoosePhotoVC.h"
#import <AVFoundation/AVFoundation.h>
#import "Tools.h"
#import "SZImageView.h"
@interface ChoosePhotoVC ()<UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) NSArray *array;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ChoosePhotoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configureUI];
  
}
- (void)configureUI
{
    _array = @[@"第一种拍照",@"第二种拍照"];
    [self.view addSubview:self.tableView];
    
    
    self.imageView = [[UIImageView alloc] init];
    self.imageView.frame = CGRectMake(200,200 , 100, 100);
    [self.view addSubview:self.imageView];
    
    [SZImageView shareImageView].imageBlock  = ^(UIImage *image){
        self.imageView.image = image;
    };

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
    return _array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *reuseIdentifer = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifer];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifer];
    }

    cell.textLabel.text = _array[indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        
        [self showAlertAction];

    }
    else if (indexPath.row == 1) {
        
        [[SZImageView shareImageView]getFrame:CGSizeMake(200, 300) viewController:self];

    }
}
#pragma mark -------------------------------------------------------------------------------------------------第二种方法------------------------------------------------------------



#pragma mark -------------------------------------------------------------------------------------------------第一种方法------------------------------------------------------------

- (void)requestChangePersonHeadIcon:(UIImage *)img
{
    UIImage * compressImg  = [Tools compressImageWithImage:img ScalePercent:0.001];
    NSData *imageData = UIImagePNGRepresentation(compressImg);
    self.imageView.image = [UIImage imageWithData:imageData];

}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [[info objectForKey:UIImagePickerControllerEditedImage] copy];
    
    [self requestChangePersonHeadIcon:image];
    
  
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 弹出照片选择器

- (void)showAlertAction{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"头像选择" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self getPhotosFromCamera];
    }];
    
    UIAlertAction *photoAlbum = [UIAlertAction actionWithTitle:@"从手机相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self getPhotosFromLocal];
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertController addAction:cameraAction];
    [alertController addAction:photoAlbum];
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}
#pragma mark - 从本地相册获取图片
- (void)getPhotosFromLocal
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:nil];
}
#pragma mark - 拍照
- (void)getPhotosFromCamera
{
    
    AVAuthorizationStatus AVstatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];//相机权限
    
    switch (AVstatus) {
        case AVAuthorizationStatusAuthorized:
            //DDLogDebug(@"Authorized");
            break;
        case AVAuthorizationStatusDenied:
        {
            //DDLogDebug(@"Denied");
            //提示开启相机
            UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"相机权限已关闭" message:@"请到设置->隐私->相机开启权限" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction * okAction = [UIAlertAction actionWithTitle:@"去设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [[UIApplication sharedApplication] openURL:[NSURL  URLWithString:UIApplicationOpenSettingsURLString]];
                
                return ;
            }];
            UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:okAction];
            [alert addAction:cancelAction];
            [self presentViewController:alert animated:YES completion:nil];
            return;
        }
            break;
        case AVAuthorizationStatusNotDetermined:
            //DDLogDebug(@"not Determined");
            break;
        case AVAuthorizationStatusRestricted:
            //DDLogDebug(@"Restricted");
            break;
        default:
            break;
    }
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:picker animated:YES completion:nil];
    }
    else {
        NSLog(@"模拟器中无法打开相机，请在真机中使用");
    }
}


@end
