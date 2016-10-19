//
//  ZLPhotoPreviewViewCollectionViewCell.m
//  Tutorial-UICollectionView
//
//  Created by angelen on 16/10/11.
//  Copyright © 2016年 ANGELEN. All rights reserved.
//

#import "ZLPhotoPreviewViewCollectionViewCell.h"
#import "UIImageView+WebCache.h"

#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"

static CGFloat const kPhotoTitleLabelHeight          = 42.0;
static CGFloat const kPhotoSequenceNumberLabelHeight = 44.0;
static CGFloat const kStatusBarHeight                = 20.0;

@interface ZLPhotoPreviewViewCollectionViewCell()

/** 图片 */
@property (strong, nonatomic) UIImageView *photoImageView;

/** 图片标题 */
@property (strong, nonatomic) UILabel *photoTitleLabel;

/** 图片序号 */
@property (strong, nonatomic) UILabel *photoSequenceNumberLabel;

@end

@implementation ZLPhotoPreviewViewCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUIElements];
    }
    return self;
}

- (void)setupUIElements {
    // 在这里做一些初始化操作
    self.photoImageView = [[UIImageView alloc] init];
    self.photoImageView.layer.masksToBounds = YES;
    self.photoImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.photoImageView];

    self.photoSequenceNumberLabel = [[UILabel alloc] init];
    self.photoSequenceNumberLabel.textColor = [UIColor whiteColor];
    self.photoSequenceNumberLabel.font = [UIFont boldSystemFontOfSize:17.0];
    self.photoSequenceNumberLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.photoSequenceNumberLabel];
    
    self.photoTitleLabel = [[UILabel alloc] init];
    self.photoTitleLabel.textColor = [UIColor whiteColor];
    self.photoTitleLabel.font = [UIFont systemFontOfSize:14.0];
    [self addSubview:self.photoTitleLabel];
    
    [self.photoImageView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.photoSequenceNumberLabel.bottom);
        make.bottom.equalTo(self).offset(-kPhotoTitleLabelHeight);
        make.left.right.equalTo(self);
    }];
    
    [self.photoSequenceNumberLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(kStatusBarHeight); // 状态栏的高度
        make.centerX.equalTo(self);
        make.height.equalTo(kPhotoSequenceNumberLabelHeight);
    }];
    
    [self.photoTitleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(8);
        make.bottom.equalTo(0);
        make.right.equalTo(-8);
        make.height.equalTo(kPhotoTitleLabelHeight);
    }];
}

- (void)setPhotoPreviewViewModel:(ZLPhotoPreviewViewModel *)photoPreviewViewModel {
    _photoPreviewViewModel = photoPreviewViewModel;
    
    [self.photoImageView sd_setImageWithURL:photoPreviewViewModel.photoURL placeholderImage:[[UIImage alloc] init]];
    self.photoTitleLabel.text = photoPreviewViewModel.photoTitle;
    self.photoSequenceNumberLabel.text = photoPreviewViewModel.photoSequenceNumber;
}

@end
