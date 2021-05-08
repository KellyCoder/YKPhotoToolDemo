//
//  YKBlurEffect.h
//  YKPhotoToolDemo
//
//  Created by Kevin on 2021/5/7.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YKBlurEffect : NSObject

/// 高斯模糊
/// @param frame frame
/// @param style style
+ (UIVisualEffectView *)visualEffectViewWithFrame:(CGRect)frame style:(UIBlurEffectStyle)style;

/// 图片模糊效果,缺点是加了效果后的图片会变小并且四周有白边
/// @param image image
/// @param blur 模糊值:0~无穷大
+ (UIImage *)coreBlurImage:(UIImage *)image withBlurNumber:(CGFloat)blur;


/// 模糊效果,建议使用此方法
/// @param image 需要模糊的图片
/// @param blur 模糊值:0~1
+ (UIImage *)boxblurImage:(UIImage *)image withBlurNumber:(CGFloat)blur;


@end

NS_ASSUME_NONNULL_END
