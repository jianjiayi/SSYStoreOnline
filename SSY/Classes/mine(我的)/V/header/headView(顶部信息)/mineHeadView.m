//
//  mineHeadView.m
//  SSY
//
//  Created by 大为科技 on 2018/8/1.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "mineHeadView.h"

#import "Masonry.h"

@implementation mineHeadView

#pragma mark - Intail
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self setUpUI];
    }
    return self;
}

#pragma mark - UI
-(void)setUpUI{
    self.backgroundColor = [UIColor blackColor];
    self.frame = self.bounds;
    //头像
    _headImageView = [[UIImageView alloc] init];
    _headImageView.contentMode = UIViewContentModeScaleAspectFill;
    _headImageView.clipsToBounds = YES;
    _headImageView.image = [UIImage imageNamed:@"MYtouxiang_icon"];
    [self addSubview:_headImageView];
    //按钮
    _switchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_switchBtn setTitle:@"登录/注册" forState:UIControlStateNormal];
    _switchBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:14];
    [_switchBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_switchBtn addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_switchBtn];
    
    //简介
    _abstractView = [[UIView alloc] init];
    _abstractView.backgroundColor = [UIColor whiteColor];
    _abstractView.layer.cornerRadius = 8;
    [self addSubview:_abstractView];
    //logo
    _logoView = [[UIImageView alloc] init];
    _logoView.contentMode = UIViewContentModeScaleAspectFill;
    _logoView.clipsToBounds = YES;
    _logoView.image = [UIImage imageNamed:@"logo_icon"];
    [self.abstractView addSubview:_logoView];
    //文字
    _textLabel = [[UILabel alloc] init];
    _textLabel.text = @"原生态、原产地、原工厂、原品牌";
    _textLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    _textLabel.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1/1.0];
    [self.abstractView addSubview:_textLabel];
}

#pragma mark -布局
-(void)layoutSubviews{
    [super layoutSubviews];
  
    [_headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.top.mas_equalTo(self.mas_top)setOffset:5];
        [make.left.mas_equalTo(self.mas_left)setOffset:10];
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    [_switchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.left.mas_equalTo(self.headImageView.mas_right)setOffset:10];
        make.centerY.mas_equalTo(self.headImageView);
    }];
    
    [_abstractView mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.bottom.mas_equalTo(self.mas_bottom)setOffset:0];
        make.centerX.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(ScreenW-20, 60));
    }];
    
    [_logoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.abstractView);
        [make.left.mas_equalTo(self.abstractView.mas_left)setOffset:10];
        make.size.mas_equalTo(CGSizeMake(95, 23));
    }];
    
    [_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.logoView);
        [make.left.mas_equalTo(self.logoView.mas_right)setOffset:20];
    }];

}

-(void)loginClick{
    !_loginClickBlock ? : _loginClickBlock();
}
@end
