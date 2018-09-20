//
//  recommendHeadView.m
//  SSY
//
//  Created by 大为科技 on 2018/7/27.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "recommendHeadView.h"

#import "Masonry.h"

@implementation recommendHeadView

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
    _titleImgaeView = [[UIImageView alloc] init];
    _titleImgaeView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:_titleImgaeView];
}

#pragma  mark - 布局
-(void)layoutSubviews{
    [super layoutSubviews];
    
    [_titleImgaeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(150, 15));
    }];
}

@end
