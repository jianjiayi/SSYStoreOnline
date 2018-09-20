//
//  shopHeadView.m
//  SSY
//
//  Created by 大为科技 on 2018/8/8.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "shopHeadView.h"

@implementation shopHeadView

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
    _shopIconView = [[UIImageView alloc] init];
    _shopIconView.contentMode = UIViewContentModeScaleAspectFill;
    _shopIconView.layer.cornerRadius = 5.0;
    _shopIconView.clipsToBounds = YES;
    [self addSubview:_shopIconView];
    
    _shopNameLabel = [[UILabel alloc] init];
    _shopNameLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    _shopNameLabel.textColor = [UIColor colorWithRed:16/255.0 green:0/255.0 blue:0/255.0 alpha:1/1.0];
    [self addSubview:_shopNameLabel];
    
    _follwBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_follwBtn setTitle:@"+ 关注" forState:UIControlStateNormal];
    _follwBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    [_follwBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_follwBtn setBackgroundColor:[UIColor colorWithRed:72/255.0 green:188/255.0 blue:119/255.0 alpha:1/1.0]];
//    _follwBtn.layer.cornerRadius = 13;
//    [_follwBtn setTitleEdgeInsets:UIEdgeInsetsMake(3, 10, 3, 10)];
    [_follwBtn addTarget:self action:@selector(follwBtnclick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_follwBtn];
}

#pragma mark - 布局
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [_shopIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.left.mas_equalTo(self.mas_left)setOffset:10];
        make.centerY.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [_shopNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.shopIconView);
        [make.left.mas_equalTo(self.shopIconView.mas_right)setOffset:5];
    }];
    
    [_follwBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.right.mas_equalTo(self.mas_right)setOffset:-10];
        make.centerY.mas_equalTo(self.shopIconView);
        NSString *str = self.follwBtn.titleLabel.text;
        CGSize titleSize = [str sizeWithAttributes:@{NSFontAttributeName: [UIFont fontWithName:self.follwBtn.titleLabel.font.fontName size:self.follwBtn.titleLabel.font.pointSize]}];
        titleSize.height = 26;
        titleSize.width += 26;
        self.follwBtn.layer.cornerRadius = titleSize.height/2;
       
        make.size.mas_equalTo(CGSizeMake(titleSize.width, titleSize.height));
        
//        make.height.mas_equalTo(26);
    }];
}


-(void)follwBtnclick{
    !_followButtonClickBlock? : _followButtonClickBlock();
    NSLog(@"您点击了关注");
}
@end
