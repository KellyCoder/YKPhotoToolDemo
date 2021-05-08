//
//  WatermaskViewController.m
//  YKPhotoToolDemo
//
//  Created by Kevin on 2021/5/8.
//

#import "WatermaskViewController.h"
#import "UIImage+Watermark.h"
@interface WatermaskViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *img;

@end

@implementation WatermaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"水印";
//    self.img.image = [UIImage imageNamed:@"chunjiehaibao.jpg"];
//    self.img.image = [self.img.image imageWithWaterMask:[UIImage imageNamed:@"logo.png"] inRect:CGRectMake(30, 100, 100, 100)];
    // chunjiehaibao.jpg
//    self.img.image = [self.img.image addImageLogo:[UIImage imageNamed:@"chunjiehaibao.jpg"] text:[UIImage imageNamed:@"logo.png"]];
    
    
    WatermarkObj* info = [WatermarkObj new];
    info.text = @"添加水印HDSAKH123dsjd";
    info.h_Rate = 0.1f;
    info.image = [UIImage imageNamed:@"chunjiehaibao.jpg"];
    
    self.img.image = [UIImage yk_BaseWatermarkWithInfo:info];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
