#### UICollectionViewFlowLayout

在创建 UITableView 的时候，我们使用

```objective-c
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style;
```

style 参数是用于判断 UITableView 的类型是普通的还是分组的，如果不传入这个参数，默认的类型是普通的。

在 UICollectionView 中，UICollectionViewFlowLayout 是用来设置 cell 的布局的，在初始化 UICollectionView 的时候，一定要设置这个 layout 属性，否则不会显示。

UICollectionViewFlowLayout 是 UICollectionViewLayout 的子类，它的属性有以下这些：

```objective-c
NS_CLASS_AVAILABLE_IOS(6_0) @interface UICollectionViewFlowLayout : UICollectionViewLayout

// 每行之间竖直方向上的最小间距（不过可以大于这个值）
@property (nonatomic) CGFloat minimumLineSpacing;

// 同一行中，cell 与 cell 之间水平方向上的最小间距（不过可以大于这个值）
@property (nonatomic) CGFloat minimumInteritemSpacing;

// 每一个 cell 的尺寸大小，如果说每一个 cell 的大小都是一样的话，那么就可以直接设置这个属性；
// 如果每一个 cell 的尺寸不一样，比如瀑布流，那么就要实现 UICollectionViewDelegateFlowLayout 代理的方法 ①
@property (nonatomic) CGSize itemSize;

// 预估 cell 的尺寸，在 iOS8 之后可以先预估 cell 的尺寸，然后根据实际内容自适应
@property (nonatomic) CGSize estimatedItemSize NS_AVAILABLE_IOS(8_0); // defaults to CGSizeZero - setting a non-zero size enables cells that self-size via -preferredLayoutAttributesFittingAttributes:

// 滚动的方向：垂直或者水平
@property (nonatomic) UICollectionViewScrollDirection scrollDirection; // default is UICollectionViewScrollDirectionVertical

// 组头和组尾的尺寸大小
@property (nonatomic) CGSize headerReferenceSize;
@property (nonatomic) CGSize footerReferenceSize;

// 组内容的边距，如果每个组内容的边距都是一样大小的话，那么就可以直接设置这个属性；
// 如果每个组内容的边距都不一样，那么就要实现 UICollectionViewDelegateFlowLayout 代理的方法 ②
@property (nonatomic) UIEdgeInsets sectionInset;

// 阻尼效果，如果当 UICollectionView 的 cell 比较少，没有铺满一屏，默认是没有阻尼效果的，但是 UITableView 默认有阻尼效果，科科
// Set these properties to YES to get headers that pin to the top of the screen and footers that pin to the bottom while scrolling (similar to UITableView).
@property (nonatomic) BOOL sectionHeadersPinToVisibleBounds NS_AVAILABLE_IOS(9_0);
@property (nonatomic) BOOL sectionFootersPinToVisibleBounds NS_AVAILABLE_IOS(9_0);

@end
```



**minimumLineSpacing 属性剖析**

每行之间竖直方向上的最小间距（不过可以大于这个值），苹果爸爸官方是酱紫讲的：

```objective-c
If the delegate object does not implement the collectionView(_:layout:minimumLineSpacingForSectionAt:) method, the flow layout uses the value in this property to set the spacing between lines in a section.

For a vertically scrolling grid, this value represents the minimum spacing between successive rows. For a horizontally scrolling grid, this value represents the minimum spacing between successive columns. This spacing is not applied to the space between the header and the first line or between the last line and the footer.

The default value of this property is 10.0.
```

![minimumLineSpacing](http://upload-images.jianshu.io/upload_images/683662-e10f4881aadb8642.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

**minimumInteritemSpacing 属性剖析**

同一行中，cell 与 cell 之间水平方向上的最小间距（不过可以大于这个值），苹果爸爸官方是酱紫讲的：

```objective-c
If the delegate object does not implement the collectionView:layout:minimumInteritemSpacingForSectionAtIndex: method, the flow layout uses the value in this property to set the spacing between items in the same line.

For a vertically scrolling grid, this value represents(相当于) the minimum spacing between items in the same row. For a horizontally scrolling grid, this value represents the minimum spacing between items in the same column. This spacing is used to compute how many items can fit in a single line, but after the number of items is determined, the actual spacing may possibly be adjusted upward.

The default value of this property is 10.0.
```

![minimumInteritemSpacing](http://upload-images.jianshu.io/upload_images/683662-b307afa9a697bfa9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)



**sectionInset 属性剖析**

苹果爸爸官方是酱紫讲的：

```objective-c
If the delegate object does not implement the collectionView:layout:insetForSectionAtIndex: method, the flow layout uses the value in this property to set the margins for each section.

Section insets reflect the spacing at the outer edges of the section. The margins affect the initial position of the header view, the minimum space on either side of each line of items, and the distance from the last line to the footer view. The margin insets do not affect the size of the header and footer views in the non scrolling direction.

The default edge insets are all set to 0.
```

![sectionInset](http://upload-images.jianshu.io/upload_images/683662-61f39d59605b2f84.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)





#### UICollectionViewDelegateFlowLayout

我们在使用 UITableView 的时候，需要实现 UITableViewDataSource 数据源方法和 UITableViewDelegate 代理的方法，在使用 UICollectionView 的时候，也是需要实现 UICollectionViewDataSource 数据源方法 UICollectionViewDelegateFlowLayout 代理方法，注意：UICollectionViewDelegateFlowLayout 继承于 UICollectionViewDelegate。

UICollectionViewDelegateFlowLayout 代理方法，具体的用法看 API

```objective-c
@protocol UICollectionViewDelegateFlowLayout <UICollectionViewDelegate>
@optional

// ① 设置每一 indexPath 的 cell 的大小，如果 cell 的大小都一样，可以直接设置 itemSize 属性
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

// ② 设置每个 section 的 inset，如果 section 的 inset 都一样，可以直接设置 sectionInset 属性
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;

// ③ 设置每个 section 中，每行之间竖直方向上的最小间距（不过可以大于这个值） 
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section;

// ④ 设置每个 section 中，同一行中，cell 与 cell 之间水平方向上的最小间距（不过可以大于这个值）
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section;

// ⑤ 设置每个 section 中，头视图的参考大小，跟 UITableView 类似
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section;

// ⑥ 设置每个 section 中，尾视图的参考大小，跟 UITableView 类似
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section;

@end
```

对于 ⑤ 和 ⑥ 这两个代理方法，UICollectionView 的头视图和尾视图是可以复用的，在复用的时候，头尾视图都要继承于 UICollectionReusableView，然后注册它（跟注册 cell 差不多）；在使用的时候，跟使用 cell 的思路类似：

```objective-c
- (__kindof UICollectionViewCell *)dequeueReusableCellWithReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;
- (__kindof UICollectionReusableView *)dequeueReusableSupplementaryViewOfKind:(NSString *)elementKind withReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;
```



#### UICollectionViewDataSource

UICollectionViewDataSource 数据源方法

```objective-c
@protocol UICollectionViewDataSource <NSObject>
@required

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;

@optional

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView;

// The view that is returned must be retrieved from a call to -dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath;

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(9_0);
- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath*)destinationIndexPath NS_AVAILABLE_IOS(9_0);

@end
```



#### UICollectionViewDelegate

UICollectionViewDelegate 代理方法

```objective-c
@protocol UICollectionViewDelegate <UIScrollViewDelegate>
@optional

// Methods for notification of selection/deselection and highlight/unhighlight events.
// The sequence of calls leading to selection from a user touch is:
//
// (when the touch begins)
// 1. -collectionView:shouldHighlightItemAtIndexPath:
// 2. -collectionView:didHighlightItemAtIndexPath:
//
// (when the touch lifts)
// 3. -collectionView:shouldSelectItemAtIndexPath: or -collectionView:shouldDeselectItemAtIndexPath:
// 4. -collectionView:didSelectItemAtIndexPath: or -collectionView:didDeselectItemAtIndexPath:
// 5. -collectionView:didUnhighlightItemAtIndexPath:
  
// 是否允许选中时高亮
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath;

// 高亮完成后回调
- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath;

// 由高亮转换成非高亮后回调
- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath;

// 是否允许选中
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath;

// 是否允许取消选中
- (BOOL)collectionView:(UICollectionView *)collectionView shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath; // called when the user taps on an already-selected item in multi-select mode

// 选中操作
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

// 取消选中操作
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath;

// 方法太多了，大家有兴趣就进去看看
@end
```

