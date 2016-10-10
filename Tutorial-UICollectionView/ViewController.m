//
//  ViewController.m
//  Tutorial-UICollectionView
//
//  Created by angelen on 16/10/9.
//  Copyright © 2016年 ANGELEN. All rights reserved.
//

#import "ViewController.h"
#import "ZLDiscoverCollectionViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tutorial-UICollectionView";
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeInfoLight];
    button.center = self.view.center;
    [button addTarget:self action:@selector(didTapButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)didTapButton {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 16;
    layout.minimumInteritemSpacing = 9;
    layout.sectionInset = UIEdgeInsetsMake(16, 8, 16, 8);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.sectionHeadersPinToVisibleBounds = NO; // Section header 悬浮，和 UITableView 类似
    ZLDiscoverCollectionViewController *discoverVC = [[ZLDiscoverCollectionViewController alloc] initWithCollectionViewLayout:layout];
    discoverVC.title = @"Discover";
    [self.navigationController pushViewController:discoverVC animated:YES];
}

@end
