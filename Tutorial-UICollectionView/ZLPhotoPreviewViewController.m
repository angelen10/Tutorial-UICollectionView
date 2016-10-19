//
//  ZLPhotoPreviewViewController.m
//  Tutorial-UICollectionView
//
//  Created by angelen on 16/10/11.
//  Copyright © 2016年 ANGELEN. All rights reserved.
//

#import "ZLPhotoPreviewViewController.h"
#import "ZLPhotoPreviewView.h"

@interface ZLPhotoPreviewViewController ()

@end

@implementation ZLPhotoPreviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    ZLPhotoPreviewView *photoPreviewView = [[ZLPhotoPreviewView alloc] initWithFrame:self.view.bounds];
    [photoPreviewView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapPhotoPreviewView)]];
    [self.view addSubview:photoPreviewView];
    
    ZLPhotoPreviewViewModel *model = [[ZLPhotoPreviewViewModel alloc] init];
    model.photoTitle = @"这也是一种贡献";
    model.photoURL = [NSURL URLWithString:@"http://h.hiphotos.baidu.com/image/h%3D200/sign=9d91b09b6f63f624035d3e03b745eb32/b90e7bec54e736d140a0b7aa9f504fc2d46269e4.jpg"];
    
    ZLPhotoPreviewViewModel *model2 = [[ZLPhotoPreviewViewModel alloc] init];
    model2.photoTitle = @"好久没见了";
    model2.photoURL = [NSURL URLWithString:@"http://pic15.nipic.com/20110621/2678842_143658366148_2.jpg"];
    
    ZLPhotoPreviewViewModel *model3 = [[ZLPhotoPreviewViewModel alloc] init];
    model3.photoTitle = @"尽量表现着像不在意的";
    model3.photoURL = [NSURL URLWithString:@"http://www.petsoo.cn/file/upload/201011/09/09-37-15-10-2225.jpg"];
    
    ZLPhotoPreviewViewModel *model4 = [[ZLPhotoPreviewViewModel alloc] init];
    model4.photoTitle = @"只是简单的试探啊";
    model4.photoURL = [NSURL URLWithString:@"http://d.hiphotos.baidu.com/image/h%3D200/sign=42e5a77e8e1363270aedc533a18ea056/5243fbf2b2119313e344c41261380cd791238d08.jpg"];
    
    NSArray<ZLPhotoPreviewViewModel *> *models = @[model, model2, model3, model4];
    photoPreviewView.photoPreviewViewModels = models;
}

//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    
//    [UIView animateWithDuration:0.8 animations:^{
//        self.navigationController.navigationBar.translucent = YES;
//        [self.navigationController.navigationBar setBackgroundImage:UIImage.new forBarMetrics:UIBarMetricsDefault];
//        [self.navigationController.navigationBar setShadowImage:UIImage.new];
//    }];
//}
//
//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//    self.navigationController.navigationBar.translucent = NO;
//}

- (void)didTapPhotoPreviewView {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
