//
//  SSYProductListItemCell.m
//  SSY
//
//  Created by 大为科技 on 2018/9/19.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "SSYProductListItemCell.h"

@implementation SSYProductListItemCell

#pragma mark - Intial
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self setUpUI];
    }
    return self;
}


#pragma mark - 商品推荐布局
-(void)setUpUI{
    self.backgroundColor = [UIColor whiteColor];
    
    //商品图片
    _goodsImageView = [[UIImageView alloc] init];
    _goodsImageView.contentMode = UIViewContentModeScaleAspectFill;
    _goodsImageView.clipsToBounds = YES;
    [self addSubview:_goodsImageView];
    
    //商品标题
    _goodsLabel = [[UILabel alloc] init];
    _goodsLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
    _goodsLabel.numberOfLines = 2;
    _goodsLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_goodsLabel];
    
    //商品价格
    _priceLabel = [[UILabel alloc] init];
    _priceLabel.textColor =   [UIColor colorWithRed:255/255.0 green:123/255.0 blue:59/255.0 alpha:1/1.0];
    _priceLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:10];
    [self addSubview:_priceLabel];
    
    //更多按钮
    _moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_moreBtn setTitle:@"···" forState:UIControlStateNormal];
    //    _moreBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:20];
    [_moreBtn setTitleColor:[UIColor colorWithRed:155/255.0 green:155/255.0 blue:155/255.0 alpha:1/1.0] forState:UIControlStateNormal];
    [self addSubview:_moreBtn];
    
    //透明层
    _blackView = [[UIView alloc] init];
    _blackView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    [self addSubview:_blackView];
    
    //按钮组
    _btnGroup = [[UIView alloc] init];
    //    _btnGroup.backgroundColor = [UIColor redColor];
    [_blackView addSubview:_btnGroup];
    
    //看相似
    _similarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_similarBtn setTitle:@"看相似" forState:UIControlStateNormal];
    _similarBtn.backgroundColor = [UIColor colorWithRed:72/255.0 green:188/255.0 blue:119/255.0 alpha:1/1.0];
    _similarBtn.layer.cornerRadius = 30.0;
    _similarBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
    [_similarBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_btnGroup addSubview:_similarBtn];
    //收藏
    _collectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_collectBtn setTitle:@"收藏" forState:UIControlStateNormal];
    _collectBtn.backgroundColor =  [UIColor colorWithRed:184/255.0 green:233/255.0 blue:134/255.0 alpha:1/1.0];
    _collectBtn.layer.cornerRadius = 30.0;
    _collectBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
    [_collectBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_btnGroup addSubview:_collectBtn];
}


#pragma mark - 推荐商品布局

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [_goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(self.mas_width);
        make.height.mas_equalTo(self.mas_width);
    }];
    
    [_goodsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.width.mas_equalTo(self).multipliedBy(0.9);
        make.height.mas_equalTo(40);
        [make.top.mas_equalTo(self.goodsImageView.mas_bottom)setOffset:5];
        
    }];
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.goodsLabel);
        make.width.mas_equalTo(self).multipliedBy(0.5);
        [make.top.mas_equalTo(self.goodsLabel.mas_bottom)setOffset:5];
    }];
    
    [_moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.right.mas_equalTo(self)setOffset:-10];
        make.centerY.mas_equalTo(self.priceLabel);
        make.size.mas_equalTo(CGSizeMake(35, 18));
    }];
    [_blackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self);
        make.center.equalTo(self);
    }];
    [_btnGroup mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.blackView);
        make.size.mas_equalTo(CGSizeMake(60, 150));
    }];
    [_similarBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.btnGroup.mas_top);
        make.centerX.mas_equalTo(self.btnGroup);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    [_collectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.btnGroup.mas_bottom);
        make.centerX.mas_equalTo(self.btnGroup);
        make.size.mas_equalTo(CGSizeMake(60, 60));
        
    }];
    
}

#pragma mark -设置数据



@end
