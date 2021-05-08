//
//  CutViewController.m
//  YKPhotoToolDemo
//
//  Created by Kevin on 2021/5/8.
//

#import "CutViewController.h"
#import "CutActionViewController.h"

@interface CutViewController () <UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@end

@implementation CutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"照片裁剪";
    
    UIButton *btnSelectPhoto = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 100, 40)];
    btnSelectPhoto.backgroundColor = [UIColor blackColor];
    [btnSelectPhoto setTitle:@"相册" forState:UIControlStateNormal];
    [btnSelectPhoto setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btnSelectPhoto.titleLabel.font = [UIFont systemFontOfSize:40];
    [btnSelectPhoto addTarget:self action:@selector(selectPhoto) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnSelectPhoto];
}

-(void)selectPhoto{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.sourceType = sourceType;
    imagePicker.delegate = self;
    [self presentViewController: imagePicker animated:YES completion: NULL];
}
#pragma mark - UIImagePickerDelegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage *toCropImage = info[UIImagePickerControllerOriginalImage];
    [self actionImage: toCropImage];
    [picker dismissViewControllerAnimated: YES completion: NULL];
}

- (void)actionImage:(UIImage *)image {
    
    CutActionViewController *cropImageViewController = [[CutActionViewController alloc] init];
    cropImageViewController.image = image;
    [self.navigationController pushViewController: cropImageViewController animated: YES];
    
}

@end
