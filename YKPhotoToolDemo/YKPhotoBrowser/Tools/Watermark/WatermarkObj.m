//
//  WatermarkObj.m
//  YKPhotoToolDemo
//
//  Created by Kevin on 2021/5/8.
//

#import "WatermarkObj.h"

@implementation WatermarkObj

-(instancetype)init{
    if (self = [super init]) {
        _xStartRate = 0.1;
        _yStartRate = 0.1;
        
        _w_Rate = 0.9;
        _h_Rate = 0.9;
        
        _drawRect = CGRectNull;
    }
    return self;
}

- (CGRect)drawTextRect{
    if (false == CGRectIsNull(_drawRect)) {
        return _drawRect;
    }
    
    CGSize imgSize = _image.size;
    
    CGFloat startX = imgSize.width * _xStartRate;
    CGFloat startY = imgSize.height * _yStartRate;
    
    CGFloat proposeW = imgSize.width * _w_Rate;
    CGFloat proposeH = imgSize.height * _h_Rate;
    
    CGFloat multiple = 1;
    CGFloat all2Rate = 1.0f; //x轴，y轴同比例缩放到0.9 本需要缩放到1.0 为了留空隙
    
    if (_xStartRate + _w_Rate <= all2Rate &&
        _yStartRate + _h_Rate <= all2Rate ) {
        multiple = 1;
        
    }else{
        //x轴，y轴有值超出了范围
        CGFloat xRate = _xStartRate + _w_Rate;
        CGFloat yRate = _yStartRate + _h_Rate;
        CGFloat useRate = MAX(xRate, yRate);
        
        multiple = all2Rate / useRate;
    }
    
    _drawRect = CGRectMake(ceilf(startX * multiple),
                           ceilf(startY * multiple),
                           ceilf(proposeW * multiple),
                           ceilf(proposeH * multiple)
                           );
    
    return _drawRect;
}

//获取autoFont
- (CGFloat)autoFontSize{
    if (CGRectIsNull(_drawRect)) {
        [self drawTextRect];
    }
    
    CGSize perSize =
    [self.text sizeWithAttributes:
     @{NSFontAttributeName: [UIFont systemFontOfSize:1.0f]}];
    
    CGFloat x_Font = _drawRect.size.width / perSize.width;
    CGFloat y_Font = _drawRect.size.height /perSize.height;
    
    CGFloat need_Font = MIN(x_Font, y_Font);
    
    //多出部分进行验证
    CGSize adjustSize = CGSizeMake(_drawRect.size.width + perSize.width
                                   ,_drawRect.size.height + perSize.height);
    
    //进行最后的较正
    for (int i = 1; i < need_Font; i++) {
        
        CGSize realSize =
        [self.text boundingRectWithSize:adjustSize
                                options:0
                             attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:need_Font + 1]}
                                context:nil].size;
        
        if (realSize.width > _drawRect.size.width ||
            realSize.height > _drawRect.size.height) {
            break;
        }
        
        need_Font ++;
    }
    
    return need_Font;
}

@end
