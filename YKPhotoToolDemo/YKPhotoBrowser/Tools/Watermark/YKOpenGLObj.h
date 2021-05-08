//
//  YKOpenGLObj.h
//  YKPhotoToolDemo
//
//  Created by Kevin on 2021/5/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YKOpenGLObj : NSObject

@property (nonatomic, strong) UIImage *bgImage;
@property (nonatomic, strong) UIImage *textImage;
@property (nonatomic, assign) CGRect textRect;

- (UIImage *)resultImage;

@end

NS_ASSUME_NONNULL_END
