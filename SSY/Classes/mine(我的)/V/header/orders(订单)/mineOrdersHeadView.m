//
//  mineOrdersHeadView.m
//  SSY
//
//  Created by 大为科技 on 2018/8/3.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "mineOrdersHeadView.h"

@implementation mineOrdersHeadView

#pragma mark Intail
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self setUpUI];
    }
    return self;
}
#pragma mark -UI
-(void)setUpUI{
    
    //主题
    _nameLabel = [[UILabel alloc]init];
    _nameLabel.text = @"我的订单";
    _nameLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
    _nameLabel.textColor = [UIColor colorWithRed:16/255.0 green:0/255.0 blue:0/255.0 alpha:1/1.0];
    [self addSubview:_nameLabel];
    
    //更多
    _moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_moreBtn setImage:[UIImage imageNamed:@"MYjt_icon"] forState:UIControlStateNormal];
    [_moreBtn setTitle:@"查看全部订单" forState:UIControlStateNormal];
    _moreBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:10];
    [_moreBtn setTitleColor:[UIColor colorWithRed:155/255.0 green:155/255.0 blue:155/255.0 alpha:1/1.0] forState:UIControlStateNormal];
   
    [_moreBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -_moreBtn.imageView.intrinsicContentSize.width, 0, _moreBtn.imageView.intrinsicContentSize.width)];
    [_moreBtn setImageEdgeInsets:UIEdgeInsetsMake(3,_moreBtn.titleLabel.intrinsicContentSize.width, 3, -_moreBtn.titleLabel.intrinsicContentSize.width)];
    [_moreBtn addTarget:self action:@selector(allOrderClick) forControlEvents:UIControlEventTouchUpInside];

    
    [self addSubview:_moreBtn];
    
    //line
    _lineView = [[UIView alloc] init];
    _lineView.backgroundColor = [UIColor colorWithRed:155/255.0 green:155/255.0 blue:155/255.0 alpha:1/1.0];
    [self addSubview:_lineView];
    
}

#pragma mark - 布局
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.left.mas_equalTo(self.mas_left)setOffset:15];
        make.centerY.mas_equalTo(self);
    }];
    
    [_moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.right.mas_equalTo(self.mas_right)setOffset:-15];
        make.centerY.mas_equalTo(self.nameLabel);
//        make.width.mas_equalTo(100);
    }];
   
    
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.bottom.mas_equalTo(self.mas_bottom)setOffset:-8];
        [make.left.mas_equalTo(self.mas_left)setOffset:15];
        [make.right.mas_equalTo(self.mas_right)setOffset:-15];
        make.height.mas_equalTo(0.5);
    }];
}


-(void)allOrderClick{
    if(self.moreBtn){
        self.AllOrderClickBlock();
    }
}


@end
