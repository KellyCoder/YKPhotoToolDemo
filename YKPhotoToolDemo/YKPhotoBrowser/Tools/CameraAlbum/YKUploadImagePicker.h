//
//  YKUploadImagePicker.h
//  YKPhotoToolDemo
//
//  Created by Kevin on 2021/5/8.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define kAlbumTitle @"从手机相册上传"
#define kCameraTitle @"从相机拍照上传"

NS_ASSUME_NONNULL_BEGIN

typedef void(^UploadImageBlock)(UIImage *image);

@interface YKUploadImagePicker : NSObject 

/** 图片选择回调 */
@property (nonatomic,copy) UploadImageBlock uploadBlock;

+ (YKUploadImagePicker *)sharedInstance;

/// 通用弹出相机/相册
/// @param parentVC 父控制器
/// @param uploadImageBlock 回调
- (void)showImagePickerParentVC:(UIViewController *)parentVC
               uploadImageBlock:(UploadImageBlock)uploadImageBlock;


@end

NS_ASSUME_NONNULL_END
