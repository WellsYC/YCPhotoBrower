//
//  YCCollectionViewController.m
//  YCToolkit
//
//  Created by 蔡亚超 on 2018/7/20.
//  Copyright © 2018年 WellsCai. All rights reserved.
//

#import "YCCollectionViewController.h"
#import "YCPhotoBrowserController.h"
#import "YCPhotoBrowserAnimator.h"
#import "YCCollectionViewCell.h"
#import <UIImageView+WebCache.h>

@interface YCCollectionViewController ()<AnimatorPresentedDelegate>
@property(nonatomic,strong)NSArray      *arr1;
@end

@implementation YCCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
//    self.arr1 = @[[UIImage imageNamed:@"timg"],
//                  [UIImage imageNamed:@"timg"],
//                  [UIImage imageNamed:@"timg"],
//                  [UIImage imageNamed:@"timg"],
//                  [UIImage imageNamed:@"timg"],
//                  [UIImage imageNamed:@"timg"],
//                  [UIImage imageNamed:@"timg"],
//                  [UIImage imageNamed:@"timg"],
//                  [UIImage imageNamed:@"timg"],
//                  ];
    self.arr1 = @[@"http://h.hiphotos.baidu.com/zhidao/pic/item/b3b7d0a20cf431ad6ceeb36a4d36acaf2edd98a1.jpg",
                     @"http://h.hiphotos.baidu.com/zhidao/pic/item/a50f4bfbfbedab644495da7cfc36afc378311ea2.jpg",
                     @"http://a.hiphotos.baidu.com/zhidao/pic/item/7e3e6709c93d70cf0b741421fcdcd100baa12b0b.jpg",
                     @"http://g.hiphotos.baidu.com/zhidao/pic/item/8b82b9014a90f6035dd466133112b31bb051ed7a.jpg",
                     @"http://h.hiphotos.baidu.com/zhidao/pic/item/86d6277f9e2f0708dff00629e124b899a901f226.jpg",
                     @"http://f.hiphotos.baidu.com/zhidao/pic/item/060828381f30e9241d12d97f4a086e061c95f7ce.jpg"];

    // Register cell classes
    [self.collectionView registerClass:[YCCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.arr1.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YCCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    [cell.imageView sd_setImageWithURL:self.arr1[indexPath.row] placeholderImage:[UIImage imageNamed:@"timg"]] ;
    
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = ([UIScreen mainScreen].bounds.size.width - 30)/3;
    return CGSizeMake(width, width);
}

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
@end
