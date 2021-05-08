//
//  YKUploadImagePicker.m
//  YKPhotoToolDemo
//
//  Created by Kevin on 2021/5/8.
//

#import "YKUploadImagePicker.h"

@interface YKUploadImagePicker ()
<
UINavigationControllerDelegate,
UIImagePickerControllerDelegate
>

/** 父控制器 */
@property (nonatomic,strong) UIViewController *parentVC;

@end


@implementation YKUploadImagePicker

+ (YKUploadImagePicker *)sharedInstance{
    static YKUploadImagePicker *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[YKUploadImagePicker alloc] init];
    });
    return sharedInstance;
}

- (void)showImagePickerParentVC:(UIViewController *)parentVC
               uploadImageBlock:(UploadImageBlock)uploadImageBlock{
    
    self.parentVC = parentVC;
    
    self.uploadBlock = uploadImageBlock;
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *ablumAction = [UIAlertAction actionWithTitle:kAlbumTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self fromAlbum];
    }];
    UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:kCameraTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self fromCamera];
    }];
    
    [alertVC addAction:cancelAction];
    [alertVC addAction:ablumAction];
    [alertVC addAction:cameraAction];
    
    [parentVC presentViewController:alertVC animated:YES completion:nil];
}

- (void)fromCamera{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *imagePC = [[UIImagePickerController alloc] init];
        imagePC.sourceType                = UIImagePickerControllerSourceTypeCamera;
        imagePC.delegate                  = self;
        imagePC.allowsEditing             = YES;
        [self.parentVC presentViewController:imagePC animated:YES completion:nil];
    }else {
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"该设备没有照相机" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        [alertVC addAction:cancelAction];
        [self.parentVC presentViewController:alertVC animated:YES completion:nil];
    }
}

- (void)fromAlbum{
    UIImagePickerController *imagePC = [[UIImagePickerController alloc] init];
    imagePC.sourceType                = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePC.delegate                  = self;
    imagePC.allowsEditing             = YES;
    [self.parentVC presentViewController:imagePC animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    
    self.uploadBlock ? self.uploadBlock(image) : nil;
}

@end
