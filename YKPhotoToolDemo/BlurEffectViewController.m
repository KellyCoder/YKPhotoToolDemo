//
//  BlurEffectViewController.m
//  YKPhotoToolDemo
//
//  Created by Kevin on 2021/5/7.
//

#import "BlurEffectViewController.h"
#import "YKPhotoHeader.h"

@interface BlurEffectViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *img1;
@property (strong, nonatomic) IBOutlet UIImageView *img2;
@property (strong, nonatomic) IBOutlet UIImageView *img3;

@end

@implementation BlurEffectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"模糊效果";
    // 高斯模糊
    [self.img1 addSubview:[YKBlurEffect visualEffectViewWithFrame:self.img1.bounds style:UIBlurEffectStyleLight]];


    self.img2.image = [YKBlurEffect coreBlurImage:self.img2.image withBlurNumber:100];


//    // 推荐此种方法
    self.img3.image = [YKBlurEffect boxblurImage:self.img3.image withBlurNumber:0.5];
    
    

}



@end
