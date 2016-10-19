//
//  ZLPhotoPreviewViewModel.h
//  Tutorial-UICollectionView
//
//  Created by angelen on 16/10/11.
//  Copyright © 2016年 ANGELEN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZLPhotoPreviewViewModel : NSObject

/** 图片标题 */
@property (strong, nonatomic) NSString *photoTitle;

/** 图片地址 */
@property (strong, nonatomic) NSURL *photoURL;

/** 图片序号（第几张图片） */
@property (strong, nonatomic) NSString *photoSequenceNumber;

@end
