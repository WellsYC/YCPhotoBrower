# YCPhotoBrower
一个简单轻量的照片浏览器，可以通过传入url或UIImage创建，支持转场动画，自定义指示器样式位置，提供手势回调。

![image](https://github.com/WellsYC/YCPhotoBrower/blob/1.4.0/Untitled.gif)


## Usage


**Method1:**  using Cocoapods:
``pod 'YCPhotoBrower'``

在需要使用图片浏览器的类中导入YCPhotoBrowserController.h，如果需要动画则还得导入YCPhotoBrowserAnimator.h
```
#import "YCPhotoBrowserController.h"

#import "YCPhotoBrowserAnimator.h"
```
**Method2**: moving ``YCPhotoBrowserCompont``folder into your project.


## Example
以在CollectionView为例：
```
#pragma mark <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    // 1. 创建动画配置类
    YCPhotoBrowserAnimator *browserAnimator = [[YCPhotoBrowserAnimator alloc] initWithPresentedDelegate:self];

    // 2. 创建图片控制器类(有两种创建方式，本地图和网络图)
    // ① 网络图片
    // urlReplacing为缩略图url和高清图url的转换:比如传入@{@“small”：@“big”}
    // 即可将传入的url（带small）自动转成高清图url（带big）
    YCPhotoBrowserController *vc = [YCPhotoBrowserController instanceWithShowImagesURLs:self.arr1 urlReplacing:nil];
    // ② 本地图片（传入UIImage）
    // + (instancetype)instanceWithShowImages:(NSArray<UIImage *> *)showImages{


    // 3. 自定义配置图片控制器
    vc.placeholder = [UIImage imageNamed:@"timg"];
    // 设置点击的下标，没设置则从第一张开始
    vc.indexPath = indexPath;
    // 设置动画，没设置则没动画
    vc.browserAnimator = browserAnimator;
    ///还可以设置指示视图位置，类型，长按的回调。。。

    // 4.弹出图片控制器
    [self presentViewController:vc animated:YES completion:nil];
 }

#pragma mark - <AnimatorPresentedDelegate>
// 动画需要实现该协议，将动画的image传给动画类
- (UIImageView *)imageViewWithIndexPath:(NSIndexPath *)index{
    YCCollectionViewCell *cell = (YCCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:index];
    return cell.imageView;
}
```
