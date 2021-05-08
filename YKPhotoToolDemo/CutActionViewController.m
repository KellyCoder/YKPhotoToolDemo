//
//  CutActionViewController.m
//  YKPhotoToolDemo
//
//  Created by Kevin on 2021/5/8.
//

#import "CutActionViewController.h"
#import "TKImageView.h"

#define KScreenWidth [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height

@interface CutActionViewController () <TKImageViewDelegate>
@property (nonatomic,strong) TKImageView  *tkImageView;
@property (nonatomic,strong) UIImageView  *resImage;    //显示结果图片
@property (nonatomic,strong) UIButton *btnOK;
@property (nonatomic,strong) UIButton *btnCancel;
@end

@implementation CutActionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpTKImageView];
    
    [self addBottom];
    
}

- (void)setUpTKImageView {
    self.tkImageView = [[TKImageView alloc] initWithFrame:self.view.bounds];
    _tkImageView.toCropImage = _image;          //设置底图（必须属性!）
    
    _tkImageView.needScaleCrop = YES;           //允许手指捏和缩放裁剪框
    _tkImageView.showInsideCropButton = YES;    //允许内部裁剪按钮
    _tkImageView.btnCropWH = 30;                //内部裁剪按钮宽高，有默认值，不设也没事
    _tkImageView.delegate = self;               //需要实现内部裁剪代理事件
    _tkImageView.cropAspectRatio = 1.0;
    [self.view addSubview:_tkImageView];
    
}

-(void) addBottom {
    self.btnOK = [[UIButton alloc] initWithFrame:CGRectMake(100, KScreenHeight - 60, 60, 40)];
    _btnOK.backgroundColor = [UIColor whiteColor];
    [_btnOK setTitle:@"确定" forState:UIControlStateNormal];
    [_btnOK setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btnOK addTarget:self action:@selector(clickOkBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnOK];
    
    self.btnCancel = [[UIButton alloc] initWithFrame:CGRectMake( 220, KScreenHeight - 60, 60, 40)];
    _btnCancel.backgroundColor = [UIColor whiteColor];
    [_btnCancel setTitle:@"取消" forState:UIControlStateNormal];
    [_btnCancel setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btnCancel addTarget:self action:@selector(clickCancelBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnCancel];
}

-(void) clickOkBtn{
    self.resImage.image = _tkImageView.currentCroppedImage;
    [self.view addSubview:_resImage];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _resImage.removeFromSuperview;
    });
}

-(void) clickCancelBtn{
   [self.navigationController popViewControllerAnimated: YES];
}


#pragma mark - 裁剪代理事件
-(void)TKImageViewFinish:(UIImage *)cropImage{
    self.resImage.image = cropImage;
    [self.view addSubview:_resImage];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _resImage.removeFromSuperview;
    });
}

-(void)TKImageViewCancel{
    [self clickCancelBtn];
}

-(UIImageView *)resImage{
    if(_resImage==nil){
        _resImage=[UIImageView new];
        _resImage.frame = self.view.bounds;
        _resImage.contentMode = UIViewContentModeScaleAspectFit;
    }
    return  _resImage;
}

@end
