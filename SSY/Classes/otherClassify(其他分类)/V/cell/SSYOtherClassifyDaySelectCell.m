//
//  SSYOtherClassifyDaySelectCell.m
//  SSY
//
//  Created by 大为科技 on 2018/9/17.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "SSYOtherClassifyDaySelectCell.h"

@implementation SSYOtherClassifyDaySelectCell

-(instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self setUpUI];
    }
    return self;
}

-(void)setUpUI{
    _imgView = [[UIImageView alloc] init];
    _imgView.contentMode = UIViewContentModeScaleAspectFit;
    _imgView.clipsToBounds = YES;
    _imgView.backgroundColor = [UIColor grayColor];
    [self addSubview:_imgView];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.font = PFR12Font;
    _titleLabel.textColor = RGB(16, 0, 0);
    _titleLabel.numberOfLines = 2;
    _titleLabel.text = @"sad巴黎婚纱对方把华盛顿不发货时大部分那上课的爆发式的步伐会受到";
    [self addSubview:_titleLabel];
    
    _priceLabel = [[UILabel alloc] init];
    _priceLabel.font = PFR12Font;
    _priceLabel.textColor = RGB(255, 123, 59);
    _priceLabel.text = @"￥ 20.5";
    [self addSubview:_priceLabel];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(4);
        make.width.mas_equalTo(self.mas_width).multipliedBy(0.9);
        make.height.mas_equalTo(self.mas_width).multipliedBy(0.9);
        make.centerX.mas_equalTo(self);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.top.mas_equalTo(self.imgView.mas_bottom)setOffset:5];
        make.width.mas_equalTo(self.imgView.mas_width);
        make.centerX.mas_equalTo(self);
    }];
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.top.mas_equalTo(self.titleLabel.mas_bottom)setOffset:5];
        [make.left.mas_equalTo(self.imgView.mas_left)setOffset:0];
    }];
    
}


-(void)setDaySelectModel:(SSYOtherClassifyDaySelectModel *)daySelectModel
{
    _daySelectModel = daySelectModel;
    self.imgView.image = [UIImage imageNamed:daySelectModel.imgUrl];
    self.titleLabel.text = daySelectModel.title;
    self.priceLabel.text = [NSString stringWithFormat:@"￥ %@",daySelectModel.price];
}


@end
