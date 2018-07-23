//
//  YCCollectionViewCell.m
//  YCToolkit
//
//  Created by 蔡亚超 on 2018/7/20.
//  Copyright © 2018年 WellsCai. All rights reserved.
//

#import "YCCollectionViewCell.h"

@implementation YCCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        self.imageView.clipsToBounds = YES;

        [self addSubview:self.imageView];
    }
    return self;
}

@end
