//
//  shopProItemCell.m
//  SSY
//
//  Created by 大为科技 on 2018/8/8.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "shopProItemCell.h"

@implementation shopProItemCell

#pragma mark - Intail
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
    
    _proImageView = [[UIImageView alloc] init];
    _proImageView.contentMode = UIViewContentModeScaleAspectFill;
    _proImageView.clipsToBounds = YES;
    [self addSubview:_proImageView];
    
}

#pragma mark - 布局
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [_proImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self);
    }];
    
}

@end
