//
//  ZLInfiniteScrollingView.m
//  Tutorial-UICollectionView
//
//  Created by angelen on 16/10/10.
//  Copyright © 2016年 ANGELEN. All rights reserved.
//

#import "ZLInfiniteScrollingView.h"
#import "ZLInfiniteScrollingCell.h"

static NSString       *const kCellReuseIdentifier     = @"kCellReuseIdentifier";
static NSTimeInterval  const kAutomaticScrollDuration = 2.0;
static NSUInteger      const kMaximumSection          = 100;

@interface ZLInfiniteScrollingView()<UICollectionViewDataSource, UICollectionViewDelegate>

/** 滚动无限轮播图 */
@property (strong, nonatomic) UICollectionView *collectionView;

/** 滚动无限轮播布局 */
@property (strong, nonatomic) UICollectionViewFlowLayout *flowLayout;

/** 滚动无限轮播定时器 */
@property (strong, nonatomic) NSTimer *timer;

/** 指示器 */
@property (strong, nonatomic) UIPageControl *pageControl;

@end

@implementation ZLInfiniteScrollingView

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
    self.collectionView.backgroundColor = [UIColor orangeColor];
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = YES;
    self.collectionView.scrollsToTop = NO;
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.collectionView registerClass:[ZLInfiniteScrollingCell class] forCellWithReuseIdentifier:kCellReuseIdentifier];
    [self addSubview:self.collectionView];
    
    self.pageControl = [[UIPageControl alloc] init];
    self.pageControl.center = CGPointMake(self.bounds.size.width * 0.5, 160 + 44);
    self.pageControl.bounds = CGRectMake(0, 0, 150, 40);
    self.pageControl.pageIndicatorTintColor = [UIColor blueColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    self.pageControl.enabled = NO;
    self.pageControl.numberOfPages = 5;
    [self addSubview:self.pageControl];
    
    [self addTimer];
}

#pragma mark - Timer

- (void)addTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:kAutomaticScrollDuration target:self selector:@selector(automaticScroll) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
}

- (void)removeTimer {
    [self.timer invalidate];
    self.timer = nil;
}

- (void)automaticScroll {
    NSIndexPath *currentIndexPath = [self.collectionView indexPathsForVisibleItems].lastObject;
    NSIndexPath *currentIndexPathReset = [NSIndexPath indexPathForItem:currentIndexPath.item inSection:kMaximumSection / 2];
    
    [self.collectionView scrollToItemAtIndexPath:currentIndexPathReset atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
    NSInteger nextItem = currentIndexPathReset.item + 1;
    NSInteger nextSection = currentIndexPathReset.section;
    
    if (nextItem == 5) {
        nextItem = 0;
        nextSection = nextSection + 1;
    }
    
    NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:nextItem inSection:nextSection];
    [self.collectionView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}

#pragma mark - <UIScrollViewDelegate>

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self removeTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self addTimer];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // 设置页码
    NSInteger currentPage = (NSInteger)(scrollView.contentOffset.x / scrollView.frame.size.width) % 5;
    self.pageControl.currentPage = currentPage;
}

#pragma mark - <UICollectionViewDataSource> & <UICollectionViewDelegate>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return kMaximumSection;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZLInfiniteScrollingCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellReuseIdentifier forIndexPath:indexPath];
    // 在这里设置 model
    return cell;
}

@end
