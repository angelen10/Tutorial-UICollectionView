//
//  ZLBannerCollectionViewCell.m
//  Tutorial-UICollectionView
//
//  Created by angelen on 16/10/10.
//  Copyright © 2016年 ANGELEN. All rights reserved.
//

#import "ZLBannerCollectionViewCell.h"
#import "UIImageView+WebCache.h"

#define RANDOM_COLOR        [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];

@interface ZLBannerCollectionViewCell()

@property (strong, nonatomic) UILabel *imageLabel;
/** photo */
@property (strong, nonatomic) UIImageView *photoImageView;

@end

@implementation ZLBannerCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUIElements];
    }
    return self;
}

- (void)setupUIElements {
    // 在这里做一些初始化操作
//    self.contentView.backgroundColor = RANDOM_COLOR;
    
    self.imageLabel = [[UILabel alloc] initWithFrame:self.bounds];
    self.imageLabel.textColor = RANDOM_COLOR;
    self.imageLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.imageLabel];
    
    self.photoImageView = [[UIImageView alloc] init];
    self.photoImageView.frame = CGRectMake(0, 0, 400, 400);
    self.photoImageView.image = [UIImage imageNamed:@"bg"];
    [self addSubview:self.photoImageView];
}

- (void)setUrl:(NSString *)url {
    NSLog(@"--------> %@", url);
    self.imageLabel.text = url;
    
    [self.photoImageView sd_setImageWithURL:[NSURL URLWithString:url]];
}

@end
