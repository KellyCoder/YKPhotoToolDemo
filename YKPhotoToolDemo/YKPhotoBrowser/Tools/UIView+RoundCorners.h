//
//  UIView+RoundCorners.h
//  YKPhotoToolDemo
//
//  Created by Kevin on 2021/5/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (RoundCorners)

/// 四边圆角
- (void)bezierRoundCorners;

/// 四边圆角,指定圆角大小
/// @param cornerRadius 圆角大小
- (void)bezierRoundCornersWithCornerRadius:(CGFloat)cornerRadius;

/// 圆角,指定方向和大小
/// @param corners 圆角方向
/// @param radius 圆角大小
- (void)bezierCornerWithApplyRoundCorners:(UIRectCorner)corners
                                   radius:(CGFloat)radius;

/// 圆角+边框
/// @param corners 圆角方向
/// @param radius 圆角大小
/// @param strokeColor 边框颜色
/// @param lineWidth 边框宽度
- (void)bezierCornerBorderWithApplyRoundCorners:(UIRectCorner)corners
                                         radius:(CGFloat)radius
                                    strokeColor:(UIColor *)strokeColor
                                      lineWidth:(CGFloat)lineWidth;

/// 边框
/// @param strokeColor 边框颜色
/// @param lineWidth 边框宽度
- (void)bezierBorderWithStrokeColor:(UIColor *)strokeColor
                          lineWidth:(CGFloat)lineWidth;

@end

NS_ASSUME_NONNULL_END
