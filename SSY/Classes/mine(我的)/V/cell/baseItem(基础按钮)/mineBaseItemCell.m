//
//  mineBaseItemCell.m
//  SSY
//
//  Created by 大为科技 on 2018/8/7.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "mineBaseItemCell.h"

@implementation mineBaseItemCell

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
    _iconImageView.clipsToBounds = YES;
    [self addSubview:_iconImageView];
    //名称
    _textLabel = [[UILabel alloc] init];
    _textLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    _textLabel.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1/1.0];
    [self addSubview:_textLabel];
}

#pragma mark - 布局
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        [make.top.mas_equalTo(self.mas_top)setOffset:20];
        make.size.mas_equalTo(CGSizeMake(25, 25));
    }];
    
    [_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.height.mas_equalTo(20);
        [make.top.mas_equalTo(self.iconImageView.mas_bottom)setOffset:8];
    }];
}


-(void)setBaseItemModel:(SSYMineBaseItemModel *)baseItemModel
{
    _baseItemModel = baseItemModel;
    self.iconImageView.image = [UIImage imageNamed:baseItemModel.iconUrl];
    self.textLabel.text = baseItemModel.iconName;
}

@end
