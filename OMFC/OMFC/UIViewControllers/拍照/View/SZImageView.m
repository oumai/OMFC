//
//  SZImageView.m
//  CheckCamera
//
//  Created by 哲 on 17/2/23.
//  Copyright © 2017年 XSZ. All rights reserved.
//
#define Widthscale(scale) ((([UIScreen mainScreen].bounds.size.width) * scale) / (375))
#define Heightscale(scale) ((([UIScreen mainScreen].bounds.size.height) * scale) / (667))
#import "SZImageView.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface SZImageView()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property(nonatomic,strong)UINavigationController *navigation;
@property(nonatomic,strong) UIView *viewbg;
@property(nonatomic,strong)UIViewController *viewImageController;
@end
@implementation SZImageView
+(SZImageView *)shareImageView{
    static SZImageView *imageview = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        
        imageview = [[[NSBundle mainBundle]loadNibNamed:@"SZImageView" owner:nil options:nil]lastObject];
    });
    return imageview;
}
- (void)showAlertAction{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"头像选择" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    UIAlertAction *photoAlbum = [UIAlertAction actionWithTitle:@"从手机相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertController addAction:cameraAction];
    [alertController addAction:photoAlbum];
    [alertController addAction:cancelAction];
    
    //[self presentViewController:alertController animated:YES completion:nil];
    
}

-(void )getFrame:(CGSize)size viewController:(id)viewController{
    self.viewImageController = viewController;
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.frame = [UIScreen mainScreen].bounds;
    _viewbg = [[UIView alloc]initWithFrame:window.frame];
    _viewbg.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.3];
    [window addSubview:_viewbg];
     [_viewbg addSubview:self];
   
    self.frame = CGRectMake(0, 0,Widthscale(size.width), Heightscale(size.height));
    self.center = window.center;
}

- (IBAction)openCamera:(UIButton*)sender {
    [self configImagePickerController:1];
}

- (IBAction)openPhoto:(UIButton*)sender {
    
     [self configImagePickerController:0];
}
- (IBAction)delect:(UIButton *)sender {
    [self delectAllView];
}
-(void)delectAllView{
        [self removeFromSuperview];
        [self.viewbg removeFromSuperview];
}
-(void)configImagePickerController:(NSInteger)number{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES; //可编辑
    
    switch (number) {
        case 0:
            //判断是否可以打开相册
            if ([self isPhotoLibrary]) {
                picker.sourceType =UIImagePickerControllerSourceTypePhotoLibrary;
            }else{
                NSLog(@"无法打开相册");
                return;
            }
            break;
        case 1:
            if ([self isCameravail]){
                //摄像头
                picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            }else{
                NSLog(@"没有摄像头");
                return;
            }
            break;
        default:
            break;
    }
    
    
    [self delectAllView];
    [self.viewImageController  presentViewController:picker animated:YES completion:nil];
   
}
//判断相机是否可用
-(BOOL)isCameravail{
    return   [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}
-(BOOL)isPhotoLibrary{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    NSString *mdeiaType = [info objectForKey:UIImagePickerControllerMediaType];
    if ([mdeiaType isEqualToString:(__bridge NSString*)kUTTypeImage]) {
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
            SEL saveImage = @selector(ImageWasSaveSuccessfully:didFinishSavingWithError:contextInfo:);
            UIImageWriteToSavedPhotosAlbum(image, self, saveImage, nil);
        }
            self.imageBlock(image);
    }else{
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}
-(void)ImageWasSaveSuccessfully:(UIImage *)paraImage didFinishSavingWithError:(NSError *)error contextInfo:(NSDictionary<NSString *,id> *)paraInfo{
    if (error == nil) {
        NSLog(@"保存成功");
    }else{
        NSLog(@"%@",error);
    }
}


/* 下面的代码是一些相关的设置，如果想了解自己可以看一看
 */

//-(void)configImagePickerController{
//    
//    [self removeFromSuperview];
//    [self.viewbg removeFromSuperview];
//
//    UIImagePickerController *controller =[[UIImagePickerController alloc]init];
//    
//    controller.sourceType = UIImagePickerControllerSourceTypeCamera;
//    NSString * requireMediaType = (__bridge NSString*)kUTTypeImage;
//    controller.mediaTypes = [[NSArray alloc]initWithObjects:requireMediaType, nil];
//    
//    controller.allowsEditing  = false;
//    controller.delegate =  self;
//    //打开闪光灯
//    controller.cameraFlashMode=  UIImagePickerControllerCameraFlashModeOn;
//    [self.viewImageController presentViewController:controller animated:YES completion:nil];
//    
//    
//}


//

////前置闪光灯是否可用
//-(BOOL)isCameraFlashavailFront{
//    return  [UIImagePickerController isFlashAvailableForCameraDevice:UIImagePickerControllerCameraDeviceFront];
//}
////后置闪光灯是否可用
//-(BOOL)isCameraFlashavailRear{
//    return  [UIImagePickerController isFlashAvailableForCameraDevice:UIImagePickerControllerCameraDeviceRear];
//}
//
////前摄像头是否可用
//-(BOOL)isCameraavailFront{
//    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
//}
////后置摄像头会否可用
//-(BOOL)isCameraavailRear{
//    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
//}
////判断是否支持拍照和录像
//-(BOOL)isCameraSupportMedia:(NSString *)paraMediaType
//{
//    NSArray *avaiablemedia = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
//    for (NSString *item in avaiablemedia) {
//        if ([item isEqualToString:paraMediaType]) {
//            return true;
//        }
//    }
//    return false;
//}


@end
