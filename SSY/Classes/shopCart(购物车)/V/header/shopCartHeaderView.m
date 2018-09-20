//
//  shopCartHeaderView.m
//  SSY
//
//  Created by 大为科技 on 2018/8/15.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "shopCartHeaderView.h"

@implementation shopCartHeaderView

#pragma mark - Init
-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if(self){
        [self setUpUI];
    }
    return self;
}

#pragma mark - UI
-(void)setUpUI{
    //选择按钮
    _clickBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_clickBtn setImage:[UIImage imageNamed:@"unClick_icon"] forState:UIControlStateNormal];
    [_clickBtn setImageEdgeInsets:UIEdgeInsetsMake(11, 6, 11, 6)];
    [_clickBtn addTarget:self action:@selector(shopsClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_clickBtn];
    //icon
    _shopImageView = [[UIImageView alloc] init];
    _shopImageView.contentMode = UIViewContentModeScaleAspectFill;
    _shopImageView.clipsToBounds = YES;
    _shopImageView.image = [UIImage imageNamed:@"shop_icon"];
    [self addSubview:_shopImageView];
    //店铺名称
    _shopNameBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_shopNameBtn setTitle:@"流星雨" forState:UIControlStateNormal];
    _shopNameBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    [_shopNameBtn setTitleColor:[UIColor colorWithRed:16/255.0 green:0/255.0 blue:0/255.0 alpha:1/1.0] forState:UIControlStateNormal];
    [_shopNameBtn setImage:[UIImage imageNamed:@"right_arrow"] forState:UIControlStateNormal];
    [_shopNameBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -_shopNameBtn.imageView.intrinsicContentSize.width, 0, _shopNameBtn.imageView.intrinsicContentSize.width)];
    [_shopNameBtn setImageEdgeInsets:UIEdgeInsetsMake(13,_shopNameBtn.titleLabel.intrinsicContentSize.width+6, 13, 0)];
    
    [self addSubview:_shopNameBtn];
}

#pragma mark -布局
-(void)layoutSubviews{
    [super layoutSubviews];
    
    [_clickBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.left.mas_equalTo(5);
        make.size.mas_equalTo(CGSizeMake(30, 40));
    }];
    
    [_shopImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        [make.left.mas_equalTo(self.clickBtn.mas_right)setOffset:10];
        make.size.mas_equalTo(CGSizeMake(15, 15));
    }];
    
    [_shopNameBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        [make.left.mas_equalTo(self.shopImageView.mas_right)setOffset:10];
        make.height.mas_equalTo(self);
    }];
    
}

//选择商家
-(void)shopsClick:(UIButton *)sender{
    sender.selected = !sender.selected;
    if(sender.selected){
        [sender setImage:[UIImage imageNamed:@"clicked_icon"] forState:UIControlStateNormal];
        [sender setImageEdgeInsets:UIEdgeInsetsMake(9, 4, 9, 4)];
    }else{
        [sender setImage:[UIImage imageNamed:@"unClick_icon"] forState:UIControlStateNormal];
        [sender setImageEdgeInsets:UIEdgeInsetsMake(11, 6, 11, 6)];
    }

    if(self.clickBtn){
        self.shopClickBlock(sender.selected);
    }
}

//赋值
-(void)setStoreModel:(shopCartStoreModel *)storeModel
{
    //选择按钮
    self.isClick = storeModel.isSelect;
    //修改按钮状态
    if(storeModel.isSelect){
        [self.clickBtn setImage:[UIImage imageNamed:@"clicked_icon"] forState:UIControlStateNormal];
        [self.clickBtn setImageEdgeInsets:UIEdgeInsetsMake(9, 4, 9, 4)];
    }else{
        [self.clickBtn setImage:[UIImage imageNamed:@"unClick_icon"] forState:UIControlStateNormal];
        [self.clickBtn setImageEdgeInsets:UIEdgeInsetsMake(11, 6, 11, 6)];
    }
    //商家图片
    self.shopImageView.image = [UIImage imageNamed:[NSString stringWithFormat: @"%@",storeModel.shopIcon]];
    //商家名称
    [self.shopNameBtn setTitle:[NSString stringWithFormat:@"%@",storeModel.shopName] forState:UIControlStateNormal];
}

//赋值选择状态
-(void)setIsClick:(BOOL)isClick
{
    _isClick = isClick;
    self.clickBtn.selected = isClick;
    //修改按钮状态
    if(isClick){
        [self.clickBtn setImage:[UIImage imageNamed:@"clicked_icon"] forState:UIControlStateNormal];
        [self.clickBtn setImageEdgeInsets:UIEdgeInsetsMake(9, 4, 9, 4)];
    }else{
        [self.clickBtn setImage:[UIImage imageNamed:@"unClick_icon"] forState:UIControlStateNormal];
        [self.clickBtn setImageEdgeInsets:UIEdgeInsetsMake(11, 6, 11, 6)];
    }
}



@end
