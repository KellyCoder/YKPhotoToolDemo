//
//  UIImage+Watermark.h
//  YKPhotoToolDemo
//
//  Created by Kevin on 2021/5/8.
//

#import <UIKit/UIKit.h>
#import "WatermarkObj.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Watermark)

/// 添加图片水印
/// @param mask 水印图片
/// @param rect 水印位置
- (UIImage *)imageWithWaterMask:(UIImage *)mask
                         inRect:(CGRect)rect;

/// 添加图片水印
/// @param img 需要添加水印的图片
/// @param logo 水印图片
- (UIImage *)addImageLogo:(UIImage *)img
                     text:(UIImage *)logo;

#pragma mark - 添加文字水印
/// 添加文字水印,不处理字体与背景图片撞色
/// @param info 添加的基本信息
+ (UIImage *)yk_BaseWatermarkWithInfo:(WatermarkObj *)info;

/// 添加文字水印,自动处理字体与背景图片撞色
/// @param info 添加的基本信息
+ (UIImage *)yk_openGLWaterMarkWithInfo:(WatermarkObj *)info;


@end

NS_ASSUME_NONNULL_END
