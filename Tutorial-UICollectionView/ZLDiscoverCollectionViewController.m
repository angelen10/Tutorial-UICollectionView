//
//  ZLDiscoverCollectionViewController.m
//  Tutorial-UICollectionView
//
//  Created by angelen on 16/10/9.
//  Copyright © 2016年 ANGELEN. All rights reserved.
//

// 参考网址：http://www.jianshu.com/p/cf616f73d596

#import "ZLDiscoverCollectionViewController.h"
#import "ZLDiscoverCollectionViewCell.h"
#import "ZLAdCollectionReusableView.h"
#import "ZLMemberCollectionReusableView.h"

#define SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height

@interface ZLDiscoverCollectionViewController ()<UICollectionViewDelegateFlowLayout>

@end

@implementation ZLDiscoverCollectionViewController

static NSString *const kCellReuseIdentifier   = @"kCellReuseIdentifier";
static NSString *const kAdReuseIdentifier     = @"kAdReuseIdentifier";
static NSString *const kMemberReuseIdentifier = @"kMemberReuseIdentifier";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    // Register cell classes，这里的 registerClass 和 dequeueReusableCell 可以封装在自定义的 cell 里面
    [self.collectionView registerClass:[ZLDiscoverCollectionViewCell class] forCellWithReuseIdentifier:kCellReuseIdentifier];
    
    [self.collectionView registerClass:[ZLAdCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kAdReuseIdentifier];
    [self.collectionView registerClass:[ZLMemberCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kMemberReuseIdentifier];
}

#pragma mark - <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 25;
    } else if (section == 1) {
        return 60;
    }
    
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZLDiscoverCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellReuseIdentifier forIndexPath:indexPath];
    // 在这里传递一个 model 什么的
    return cell;
}

#pragma mark - <UICollectionViewDelegate>

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger section = indexPath.section;
    if (kind == UICollectionElementKindSectionHeader) {
        if (section == 0) {
            ZLAdCollectionReusableView *adReusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kAdReuseIdentifier forIndexPath:indexPath];
            return adReusableView;
        } else if (section == 1) {
            ZLMemberCollectionReusableView *memberReusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kMemberReuseIdentifier forIndexPath:indexPath];
            return memberReusableView;
        }
    }
    return nil;
}

#pragma mark - <UICollectionViewDelegateFlowLayout>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger section = indexPath.section;
    if (section == 0) {
        return CGSizeMake(64, 64);
    } else if (section == 1) {
        return CGSizeMake(32, 12);
    }
    
    return CGSizeZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return CGSizeMake(SCREEN_WIDTH, [ZLAdCollectionReusableView reusableViewHeight]);
    } else if (section == 1) {
        return CGSizeMake(SCREEN_WIDTH, [ZLMemberCollectionReusableView reusableViewHeight]);
    }
    
    return CGSizeZero;
}

@end
