//
//  UIImage+Mosaic.h
//  YKPhotoToolDemo
//
//  Created by Kevin on 2021/5/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Mosaic)

/// 通过遍历像素点实现马赛克效果
/// @param image 需要马赛克的图片
/// @param level level越大,马赛克颗粒越大,若level为0则默认为图片1/20
+ (UIImage *)getMosaicImageWith:(UIImage *)image
                          level:(NSInteger)level;

@end

NS_ASSUME_NONNULL_END
