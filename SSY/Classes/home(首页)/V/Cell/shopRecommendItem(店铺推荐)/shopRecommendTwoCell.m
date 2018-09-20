//
//  shopRecommendTwoCell.m
//  SSY
//
//  Created by 大为科技 on 2018/7/31.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "shopRecommendTwoCell.h"

#import "Masonry.h"

@implementation shopRecommendTwoCell

#pragma mark - Intail
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self setUpUI];
    }
    return self;
}

#pragma mark -UI
-(void)setUpUI{
    _imageView = [[UIImageView alloc] init];
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    _imageView.clipsToBounds = YES;
    [self addSubview:_imageView];
}

#pragma mark - 布局
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(self.frame.size.width-20, self.frame.size.height-20));
        make.center.mas_equalTo(self);
    }];
}

@end
