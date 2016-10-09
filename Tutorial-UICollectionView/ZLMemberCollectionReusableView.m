

//
//  ZLMemberCollectionReusableView.m
//  Tutorial-UICollectionView
//
//  Created by angelen on 16/10/9.
//  Copyright © 2016年 ANGELEN. All rights reserved.
//

#import "ZLMemberCollectionReusableView.h"

@implementation ZLMemberCollectionReusableView

+ (CGFloat)reusableViewHeight {
    return 10;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor greenColor];
    }
    return self;
}

@end
