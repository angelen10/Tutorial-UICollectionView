//
//  ZLDiscoverDetailViewController.m
//  Tutorial-UICollectionView
//
//  Created by angelen on 16/10/10.
//  Copyright © 2016年 ANGELEN. All rights reserved.
//

#import "ZLDiscoverDetailViewController.h"
#import "ZLInfiniteScrollingView.h"

@interface ZLDiscoverDetailViewController ()

@end

@implementation ZLDiscoverDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZLInfiniteScrollingView *infiniteScrollingView = [[ZLInfiniteScrollingView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 250)];
    [self.view addSubview:infiniteScrollingView];
}

@end
