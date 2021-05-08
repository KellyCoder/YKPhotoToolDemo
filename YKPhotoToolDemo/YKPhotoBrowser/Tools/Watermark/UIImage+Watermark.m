//
//  UIImage+Watermark.m
//  YKPhotoToolDemo
//
//  Created by Kevin on 2021/5/8.
//

#import "UIImage+Watermark.h"
#import <CoreText/CoreText.h>
#import "YKOpenGLObj.h"

@implementation UIImage (Watermark)

// 画水印
- (UIImage *)imageWithWaterMask:(UIImage*)mask
                         inRect:(CGRect)rect{
    
    UIGraphicsBeginImageContextWithOptions([self size], NO, 0.0); // 0.0 for scale means "scale for device's main screen".
    //原图
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    //水印图
    [mask drawInRect:rect];
    UIImage *newPic = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newPic;
}

- (UIImage *)addImageLogo:(UIImage *)img
                     text:(UIImage *)logo{
    //get image width and height
    int w = img.size.width;
    int h = img.size.height;
    int logoWidth = logo.size.width;
    int logoHeight = logo.size.height;
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    //create a graphic context with CGBitmapContextCreate
    CGContextRef context = CGBitmapContextCreate(NULL,
                                                 w,
                                                 h,
                                                 8,
                                                 44 *w,
                                                 colorSpace,
                                                 kCGImageAlphaPremultipliedFirst);
    CGContextDrawImage(context,CGRectMake(0, 0, w, h), img.CGImage);
    CGContextDrawImage(context,CGRectMake(w-logoWidth, 0, logoWidth, logoHeight),
                       [logo CGImage]);
    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    return [UIImage imageWithCGImage:imageMasked];
}

#pragma amrk - base
+ (UIImage *)yk_BaseWatermarkWithInfo:(WatermarkObj *)info{
    CGSize imgSize = info.image.size;
    //1.开启上下文
    UIGraphicsBeginImageContextWithOptions(imgSize, NO, 0);
    //2.绘制图片
    [info.image drawInRect:CGRectMake(0, 0, imgSize.width, imgSize.height)];
    //添加水印文字
    CGRect textRect = [info drawTextRect];
    float fontSize = [info autoFontSize];
    [info.text drawInRect:textRect withAttributes:
     @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize],
       NSForegroundColorAttributeName : UIColor.whiteColor
     }];
    //    [info.text drawAtPoint:info.point withAttributes:info.textDrawInfo];
    //3.从上下文中获取新图片
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    //4.关闭图形上下文
    UIGraphicsEndImageContext();
    //返回图片
    return newImage;
}

#pragma mark - OpenGL
+ (UIImage *)yk_openGLWaterMarkWithInfo:(WatermarkObj *)info{
    //获取需要的参数
    CGRect textRect = [info drawTextRect];
    float fontSize = [info autoFontSize];
    
    CGRect drawRect = textRect;
    drawRect.origin = CGPointZero;
    
    //将文字转为图片
    UIGraphicsBeginImageContextWithOptions(textRect.size, NO, 1.0f);
    
    [info.text drawInRect:drawRect withAttributes:
     @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize],
       NSForegroundColorAttributeName : UIColor.whiteColor
     }];
    
    UIImage * textImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    YKOpenGLObj* imp = [YKOpenGLObj new];
    imp.bgImage = info.image;
    imp.textImage = textImage;
    imp.textRect = textRect;
    
    UIImage* endImg = [imp resultImage];
    
    return endImg;
}

@end
