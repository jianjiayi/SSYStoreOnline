//
//  mineOrderItemCell.m
//  SSY
//
//  Created by 大为科技 on 2018/8/3.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "mineOrderItemCell.h"

@implementation mineOrderItemCell

#pragma mark - Intial
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
    //图标
    _iconImageView = [[UIImageView alloc]init];
    _iconImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:_iconImageView];
    //状态
    _statusLabel = [[UILabel alloc] init];
    _statusLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    _statusLabel.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1/1.0];
    [self addSubview:_statusLabel];
}

#pragma mark 布局
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(20, 20));
        [make.top.mas_equalTo(self.mas_top)setOffset:10];
    }];
    
    [_statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.top.mas_equalTo(self.iconImageView.mas_bottom)setOffset:10];
        make.centerX.mas_equalTo(self);
    }];
}


-(void)setOrderItemModel:(SSYMineOrderItemModel *)orderItemModel
{
    _orderItemModel = orderItemModel;
    self.iconImageView.image = [UIImage imageNamed:orderItemModel.iconUrl];
    self.statusLabel.text = orderItemModel.iconName;
    self.tag = orderItemModel.tagID;
}

@end
