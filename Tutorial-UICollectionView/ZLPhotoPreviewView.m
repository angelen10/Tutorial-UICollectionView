//
//  ZLPhotoPreviewView.m
//  Tutorial-UICollectionView
//
//  Created by angelen on 16/10/11.
//  Copyright © 2016年 ANGELEN. All rights reserved.
//

#import "ZLPhotoPreviewView.h"
#import "ZLPhotoPreviewViewCollectionViewCell.h"

static NSString *const kCellReuseIdentifier = @"kCellReuseIdentifier";

@interface ZLPhotoPreviewView()<UICollectionViewDataSource, UICollectionViewDelegate>

/** UICollectionView */
@property (strong, nonatomic) UICollectionView *collectionView;

/** UICollectionViewFlowLayout */
@property (strong, nonatomic) UICollectionViewFlowLayout *flowLayout;

@end

@implementation ZLPhotoPreviewView

#pragma mark - Setup UI

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUIElements];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setupUIElements];
    }
    return self;
}

- (void)setupUIElements {
    
    self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.flowLayout.minimumLineSpacing = 0;
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.flowLayout.itemSize = self.bounds.size;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:self.flowLayout];
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.scrollsToTop = NO;
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.collectionView registerClass:[ZLPhotoPreviewViewCollectionViewCell class] forCellWithReuseIdentifier:kCellReuseIdentifier];
    [self addSubview:self.collectionView];
}

#pragma mark - <UICollectionViewDataSource> & <UICollectionViewDelegate>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.photoPreviewViewModels.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZLPhotoPreviewViewCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellReuseIdentifier forIndexPath:indexPath];
    // 在这里设置 model
    ZLPhotoPreviewViewModel *photoPreviewViewModel = self.photoPreviewViewModels[indexPath.item];
    photoPreviewViewModel.photoSequenceNumber = [NSString stringWithFormat:@"%zd/%zd", indexPath.item + 1, self.photoPreviewViewModels.count];
    cell.photoPreviewViewModel = photoPreviewViewModel;
    return cell;
}

#pragma mark - Setters

- (void)setPhotoPreviewViewModels:(NSArray<ZLPhotoPreviewViewModel *> *)photoPreviewViewModels {
    _photoPreviewViewModels = photoPreviewViewModels;
}

@end
