//
//  hotGoodsItemCell.m
//  SSY
//
//  Created by 大为科技 on 2018/7/27.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "hotGoodsItemCell.h"

#import "Masonry.h"

@implementation hotGoodsItemCell

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
    self.backgroundColor = [UIColor redColor];
    
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:10];
    _titleLabel.backgroundColor = [UIColor colorWithRed:255/255.0 green:222/255.0 blue:146/255.0 alpha:1/1.0];
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.layer.cornerRadius = 8;
    _titleLabel.layer.masksToBounds = YES;
    [self addSubview:_titleLabel];
    
    _boxView = [[UIView alloc] init];
//    _boxView.backgroundColor = [UIColor redColor];
    [self addSubview:_boxView];
    
}

#pragma mark - 布局
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        [make.top.mas_equalTo(self)setOffset:(7)];
        make.size.mas_equalTo(CGSizeMake(32, 17));
    }];
    
    [_boxView mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.top.mas_equalTo(self.titleLabel.mas_bottom)setOffset:7];
        [make.width.mas_equalTo(self.mas_width)setOffset:0];
        make.centerX.mas_equalTo(self);
        [make.bottom.mas_equalTo(self.mas_bottom)setOffset:-5];
    }];
}

@end
