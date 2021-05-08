//
//  YKScratchView.h
//  YKPhotoToolDemo
//
//  Created by Kevin on 2021/5/8.
//

#import <UIKit/UIKit.h>
#import "UIImage+Mosaic.h"

NS_ASSUME_NONNULL_BEGIN

@interface YKScratchView : UIView

/** masoicImage(放在底层) */
@property (nonatomic, strong) UIImage *mosaicImage;
/** surfaceImage(放在顶层) */
@property (nonatomic, strong) UIImage *surfaceImage;
/** 恢复 */
- (void)recover;

@end

NS_ASSUME_NONNULL_END
