//
//  ZLPhotoPreviewViewCollectionViewCell.h
//  Tutorial-UICollectionView
//
//  Created by angelen on 16/10/11.
//  Copyright © 2016年 ANGELEN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLPhotoPreviewViewModel.h"

@interface ZLPhotoPreviewViewCollectionViewCell : UICollectionViewCell

/** Cell 的模型 */
@property (strong, nonatomic) ZLPhotoPreviewViewModel *photoPreviewViewModel;

@end
