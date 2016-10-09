//
//  ZLAdCollectionReusableView.m
//  Tutorial-UICollectionView
//
//  Created by angelen on 16/10/9.
//  Copyright © 2016年 ANGELEN. All rights reserved.
//

#import "ZLAdCollectionReusableView.h"

@implementation ZLAdCollectionReusableView

+ (CGFloat)reusableViewHeight {
    return 60; // 依据数据返回真实高度
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor purpleColor];
    }
    return self;
}

@end
