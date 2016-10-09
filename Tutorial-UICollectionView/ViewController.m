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
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 0.0;
    layout.minimumInteritemSpacing = 9.0;
    layout.sectionInset = UIEdgeInsetsMake(0, 9, 0, 9);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    ZLDiscoverCollectionViewController *adVC = [[ZLDiscoverCollectionViewController alloc] initWithCollectionViewLayout:layout];
    adVC.title = @"Discover";
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
