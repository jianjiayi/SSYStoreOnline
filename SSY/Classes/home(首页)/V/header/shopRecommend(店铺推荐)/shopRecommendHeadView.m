//
//  shopRecommendHeadView.m
//  SSY
//
//  Created by 大为科技 on 2018/7/30.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "shopRecommendHeadView.h"

#import "Masonry.h"

@implementation shopRecommendHeadView

#pragma mark - Intial
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self setUpUI];
    }
    return self;
}

#pragma mark - UI
-(void)setUpUI{
    _titleImageView = [[UIImageView alloc] init];
    _titleImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:_titleImageView];
}

#pragma mark - 布局
-(void)layoutSubviews{
    [super layoutSubviews];
    
    [_titleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        [make.left.mas_equalTo(self.mas_left)setOffset:10];
        make.size.mas_equalTo(CGSizeMake(120, 15));
    }];
}


@end
