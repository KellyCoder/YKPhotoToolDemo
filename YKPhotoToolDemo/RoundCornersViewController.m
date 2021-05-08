//
//  RoundCornersViewController.m
//  YKPhotoToolDemo
//
//  Created by Kevin on 2021/5/7.
//

#import "RoundCornersViewController.h"
#import "YKPhotoHeader.h"

@interface RoundCornersViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *img1;
@property (strong, nonatomic) IBOutlet UIImageView *img2;
@property (strong, nonatomic) IBOutlet UIImageView *img3;

@end

@implementation RoundCornersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"圆角+边框";
    
    //    [self.img1 bezierRoundCorners];
    //    [self.img2 bezierRoundCornersWithCornerRadius:20];
        
    
        [self.img1 bezierCornerBorderWithApplyRoundCorners:UIRectCornerTopLeft|UIRectCornerTopRight|UIRectCornerBottomRight radius:60 strokeColor:UIColor.greenColor lineWidth:10];
    
        [self.img2 bezierBorderWithStrokeColor:UIColor.purpleColor lineWidth:10];
    
    [self.img3 bezierCornerWithApplyRoundCorners:UIRectCornerTopLeft radius:30];
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
