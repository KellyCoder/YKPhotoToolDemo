//
//  WatermarkObj.h
//  YKPhotoToolDemo
//
//  Created by Kevin on 2021/5/8.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WatermarkObj : NSObject

@property (nonatomic, strong, nonnull) UIImage *image;
@property (nonatomic, copy, nonnull) NSString *text;
//起始坐标相对于图片尺寸的比率 (0 ~ 1)
@property (nonatomic, assign) CGFloat xStartRate;
@property (nonatomic, assign) CGFloat yStartRate;
//高度和宽度相对于图片尺寸的比率 (如果有值超出返回，将相对另一个值进行调整)
@property (nonatomic, assign) CGFloat w_Rate; //宽度大小
@property (nonatomic, assign) CGFloat h_Rate; //高度大小

@property (nonatomic, assign) CGRect drawRect;
//算s水印的 位置大小
- (CGRect)drawTextRect;
//动态字体大小
- (CGFloat)autoFontSize;

@end

NS_ASSUME_NONNULL_END
