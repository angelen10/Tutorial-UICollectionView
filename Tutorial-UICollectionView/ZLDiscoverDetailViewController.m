//
//  ZLDiscoverDetailViewController.m
//  Tutorial-UICollectionView
//
//  Created by angelen on 16/10/10.
//  Copyright © 2016年 ANGELEN. All rights reserved.
//

#import "ZLDiscoverDetailViewController.h"
#import "ZLInfiniteScrollingView.h"
#import "ZLBannerView.h"
#import "ZLPhotoPreviewViewController.h"

@interface ZLDiscoverDetailViewController ()

@end

@implementation ZLDiscoverDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    ZLInfiniteScrollingView *infiniteScrollingView = [[ZLInfiniteScrollingView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 250)];
//    [self.view addSubview:infiniteScrollingView];

    __weak typeof(self) weakSelf = self;
    ZLBannerView *bannerView = [ZLBannerView bannerViewWithFrame:CGRectMake(0, 300, self.view.frame.size.width, 250) placeholderImage:nil block:^(NSUInteger didselectIndex) {
        ZLPhotoPreviewViewController *vc = [[ZLPhotoPreviewViewController alloc] init];
        [weakSelf showDetailViewController:vc sender:nil];
//        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    [self.view addSubview:bannerView];
    
    bannerView.models = @[@"http://upload-images.jianshu.io/upload_images/1867003-930cad9e61c621ee.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240",
                          @"http://upload-images.jianshu.io/upload_images/1867003-b48a0bd54474aa74.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240",
                          @"http://upload-images.jianshu.io/upload_images/1867003-0a584a93145d5afe.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240",
                          @"http://upload-images.jianshu.io/upload_images/1867003-dc0cc7b2b118ebc7.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"];
    
    UIImageView *imageView =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg"]];
    [self.view addSubview:imageView];
}

@end
