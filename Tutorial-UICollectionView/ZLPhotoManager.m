//
//  ZLPhotoManager.m
//  Tutorial-UICollectionView
//
//  Created by angelen on 16/10/25.
//  Copyright © 2016年 ANGELEN. All rights reserved.
//

#import "ZLPhotoManager.h"

@interface ZLPhotoManager()<NSCopying>

@end

@implementation ZLPhotoManager

// 1. 在 .m 文件加上 static 关键字，避免外界直接访问 photoManager
static ZLPhotoManager *photoManager;

// 2. 重写 allocWithZone: 方法，在这里创建唯一的实例（注意线程安全，dispatch_once 就是线程安全的）
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        photoManager = [super allocWithZone:zone]; // 父类为其分配内存
    });
    return photoManager;
}

// 3. 提供 1 个类方法让外界访问唯一的实例（易于供外界访问）
+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        photoManager = [[self alloc] init]; // 直接调用上面重写的 allocWithZone: 方法，得到实例
    });
    return photoManager;
}

// 4. 由于对象除了通过 alloc init 创建，还可以通过 copy 来创建，因此要重写 copyWithZone: 方法，保证实例唯一（因为 copy 方法内部还是会调用 copyWithZone: 方法）
- (id)copyWithZone:(NSZone *)zone {
    return photoManager; // 因为如果调用 copy/copyWithZone: 方法，就说明 photoManager 肯定已经通过 alloc/allocWithZone:/sharedManager 得到过实例，因此这里不需要再创建
}

@end
