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

@interface ZLDiscoverDetailViewController ()

@end

@implementation ZLDiscoverDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    ZLInfiniteScrollingView *infiniteScrollingView = [[ZLInfiniteScrollingView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 250)];
//    [self.view addSubview:infiniteScrollingView];

    ZLBannerView *bannerView = [ZLBannerView bannerViewWithFrame:CGRectMake(0, 300, self.view.frame.size.width, 250) placeholderImage:nil block:^(NSUInteger didselectIndex) {
        
    }];
    [self.view addSubview:bannerView];
    
    bannerView.models = @[@"https://objccn.io/images/issues/issue-3/SV7.png",
                          @"https://objccn.io/images/issues/issue-3/SV6.png",
                          @"https://objccn.io/images/issues/issue-3/SV5.png",
                          @"https://objccn.io/images/issues/issue-3/SV4.png"];
    
    UIImageView *imageView =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg"]];
    [self.view addSubview:imageView];
}

@end
