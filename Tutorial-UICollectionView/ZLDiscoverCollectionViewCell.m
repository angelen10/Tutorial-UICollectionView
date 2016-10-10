//
//  ZLDiscoverCollectionViewCell.m
//  Tutorial-UICollectionView
//
//  Created by angelen on 16/10/10.
//  Copyright © 2016年 ANGELEN. All rights reserved.
//

#import "ZLDiscoverCollectionViewCell.h"

#define RANDOM_COLOR        [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];

@implementation ZLDiscoverCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUIElements];
    }
    return self;
}

- (void)setupUIElements {
    // 在这里做一些初始化操作
    self.contentView.backgroundColor = RANDOM_COLOR;
}

- (UIColor *)getCellBackgroundColor {
    return self.contentView.backgroundColor;
}

@end
