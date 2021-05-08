//
//  UIView+RoundCorners.m
//  YKPhotoToolDemo
//
//  Created by Kevin on 2021/5/7.
//

#import "UIView+RoundCorners.h"
#import <CoreGraphics/CoreGraphics.h>

@implementation UIView (RoundCorners)

- (void)bezierRoundCorners{
    UIBezierPath *path;
    path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(self.frame.size.width, self.frame.size.height)];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = path.CGPath;
    self.layer.mask = maskLayer;    
}

- (void)bezierRoundCornersWithCornerRadius:(CGFloat)cornerRadius{
    [self bezierCornerWithApplyRoundCorners:UIRectCornerAllCorners radius:cornerRadius];
}

- (void)bezierCornerWithApplyRoundCorners:(UIRectCorner)corners
                                   radius:(CGFloat)radius{
    UIBezierPath *path;
    path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = path.CGPath;
    self.layer.mask = maskLayer;
}

- (void)bezierCornerBorderWithApplyRoundCorners:(UIRectCorner)corners
                                         radius:(CGFloat)radius
                                    strokeColor:(UIColor *)strokeColor
                                      lineWidth:(CGFloat)lineWidth{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
    
    CAShapeLayer *temp = [CAShapeLayer layer];
    temp.lineWidth = lineWidth;
    temp.fillColor = [UIColor clearColor].CGColor;
    temp.strokeColor = strokeColor.CGColor;
    temp.frame = self.bounds;
    temp.path = path.CGPath;
    [self.layer addSublayer:temp];
    
    CAShapeLayer *mask = [[CAShapeLayer alloc]initWithLayer:temp];
    mask.path = path.CGPath;
    self.layer.mask = mask;
}


- (void)bezierBorderWithStrokeColor:(UIColor *)strokeColor
                          lineWidth:(CGFloat)lineWidth{
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.bounds];
    
    CAShapeLayer *temp = [CAShapeLayer layer];
    temp.lineWidth = lineWidth;
    temp.fillColor = [UIColor clearColor].CGColor;
    temp.strokeColor = strokeColor.CGColor;
    temp.frame = self.bounds;
    temp.path = path.CGPath;
    [self.layer addSublayer:temp];
    
    CAShapeLayer *mask = [[CAShapeLayer alloc]initWithLayer:temp];
    mask.path = path.CGPath;
    self.layer.mask = mask;
}

@end
