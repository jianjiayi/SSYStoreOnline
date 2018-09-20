//
//  shopFooterView.m
//  SSY
//
//  Created by 大为科技 on 2018/8/8.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "shopFooterView.h"

@implementation shopFooterView

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
    
    _goShopRoomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_goShopRoomBtn setTitle:@"进店看看" forState:UIControlStateNormal];
    _goShopRoomBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:10];
    [_goShopRoomBtn setTitleColor:[UIColor colorWithRed:16/255.0 green:0/255.0 blue:0/255.0 alpha:1/1.0] forState:UIControlStateNormal];
    [_goShopRoomBtn setImage:[UIImage imageNamed:@"right_arrow"] forState:UIControlStateNormal];
//    _goShopRoomBtn.backgroundColor = [UIColor redColor];
    [_goShopRoomBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -_goShopRoomBtn.imageView.intrinsicContentSize.width, 0, _goShopRoomBtn.imageView.intrinsicContentSize.width)];
    [_goShopRoomBtn setImageEdgeInsets:UIEdgeInsetsMake(11,_goShopRoomBtn.titleLabel.intrinsicContentSize.width+4, 11, 2)];
    
    [self addSubview:_goShopRoomBtn];
    
}

#pragma mark - 布局
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [_goShopRoomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.right.mas_equalTo(self.mas_right)setOffset:-10];
        make.centerY.mas_equalTo(self);
        make.height.mas_equalTo(30);
    }];
    
}


@end
