//
//  ZLPhotoPreviewView.h
//  Tutorial-UICollectionView
//
//  Created by angelen on 16/10/11.
//  Copyright © 2016年 ANGELEN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLPhotoPreviewViewModel.h"

@interface ZLPhotoPreviewView : UIView

/** 数组 */
@property (strong, nonatomic) NSArray<ZLPhotoPreviewViewModel *> *photoPreviewViewModels;

@end
