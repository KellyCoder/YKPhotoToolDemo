//
//  TableViewController.m
//  YKPhotoToolDemo
//
//  Created by Kevin on 2021/5/6.
//

#import "TableViewController.h"
#import "BlurEffectViewController.h"
#import "RoundCornersViewController.h"
#import "CutViewController.h"
#import "WatermaskViewController.h"
#import "MosaicViewController.h"
#import "YKUploadImagePicker.h"

@interface TableViewController ()
@property (nonatomic, strong) NSArray * dataArray;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    self.title = @"首页";
    self.dataArray = @[
        @[
            @"模糊",
            @"圆角",
            @"裁剪",
            @"水印",
            @"马赛克",
            @"相机/相册"
        ]
    ];
}

#pragma mark - UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *sectionArray = self.dataArray[section];
    return sectionArray.count;
}

#pragma mark - UITableView Delegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.dataArray[indexPath.section][indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        BlurEffectViewController *vc = [BlurEffectViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1){
        RoundCornersViewController *vc = [RoundCornersViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 2){
        CutViewController *vc = [CutViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 3){
        WatermaskViewController *vc = [WatermaskViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 4){
        MosaicViewController *vc = [MosaicViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 5){
 
        [[YKUploadImagePicker sharedInstance] showImagePickerParentVC:self uploadImageBlock:^(UIImage * _Nonnull image) {
                    
        }];
    }
}




@end
