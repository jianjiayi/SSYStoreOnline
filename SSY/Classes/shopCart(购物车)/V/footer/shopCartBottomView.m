//
//  shopCartBottomView.m
//  SSY
//
//  Created by 大为科技 on 2018/8/15.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "shopCartBottomView.h"

@implementation shopCartBottomView

#pragma mark - Intail
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self setUpUI];
    }
    return self;
}

#pragma mark -UI
-(void)setUpUI{
    //全选按钮
    _allClickBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_allClickBtn setImage:[UIImage imageNamed:@"unClick_icon"] forState:UIControlStateNormal];
    [_allClickBtn setImageEdgeInsets:UIEdgeInsetsMake(11, 6, 11, 6)];
    [_allClickBtn addTarget:self action:@selector(allClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_allClickBtn];
    
    _allTextLabel = [[UILabel alloc] init];
    _allTextLabel.text = @"全选";
    _allTextLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    _allTextLabel.textColor = [UIColor colorWithRed:155/255.0 green:155/255.0 blue:155/255.0 alpha:1/1.0];
    [self addSubview:_allTextLabel];
    
    
    //合计
    _allPriceLabel = [[UILabel alloc] init];
    _allPriceLabel.text = @"合计：113.80";
    _allPriceLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    _allPriceLabel.textColor = [UIColor colorWithRed:16/255.0 green:0/255.0 blue:0/255.0 alpha:1/1.0];
    [self addSubview:_allPriceLabel];
    
    //结算
    _clearingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _clearingBtn.backgroundColor = [UIColor colorWithRed:72/255.0 green:188/255.0 blue:119/255.0 alpha:1/1.0];
    [_clearingBtn setTitle:@"结算（2）" forState:UIControlStateNormal];
    _clearingBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:15];
    [_clearingBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self addSubview:_clearingBtn];
    
    _concernBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _concernBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
    [_concernBtn setTitle:@"移入关注" forState:UIControlStateNormal];
    [_concernBtn setTitleColor: [UIColor colorWithRed:16/255.0 green:0/255.0 blue:0/255.0 alpha:1/1.0] forState:UIControlStateNormal];
    _concernBtn.layer.cornerRadius = 15.0;
    _concernBtn.layer.borderColor = [UIColor grayColor].CGColor;
    _concernBtn.layer.borderWidth = 1.0;
    _concernBtn.hidden = YES;
    [self addSubview:_concernBtn];
    
    _deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _deleteBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
    [_deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
    [_deleteBtn setTitleColor: [UIColor colorWithRed:72/255.0 green:188/255.0 blue:119/255.0 alpha:1/1.0] forState:UIControlStateNormal];
    _deleteBtn.layer.cornerRadius = 15.0;
    _deleteBtn.layer.borderWidth =1.0;
    _deleteBtn.layer.borderColor = [UIColor colorWithRed:72/255.0 green:188/255.0 blue:119/255.0 alpha:1/1.0].CGColor;
    _deleteBtn.hidden = YES;
    [self addSubview:_deleteBtn];}

#pragma mark - 布局
-(void)layoutSubviews{
    [super layoutSubviews];
    
    [_allClickBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.left.mas_equalTo(self)setOffset:5];
        make.centerY.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(30, 40));
    }];
    
    [_allTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.left.mas_equalTo(self.allClickBtn.mas_right)setOffset:5];
        make.centerY.mas_equalTo(self.allClickBtn);
    }];
    
    [_clearingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.right.mas_equalTo(self)setOffset:0];
        make.centerY.mas_equalTo(self.allClickBtn);
        make.size.mas_equalTo(CGSizeMake(130, self.frame.size.height));
    }];
    
    [_allPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.right.mas_equalTo(self.clearingBtn.mas_left)setOffset:-10];
        make.centerY.mas_equalTo(self.allClickBtn);
    }];
    
    [_concernBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.right.mas_equalTo(self.deleteBtn.mas_left)setOffset:-15];
        make.centerY.mas_equalTo(self.allClickBtn);
        make.size.mas_equalTo(CGSizeMake(80, 30));
    }];
    
    [_deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.right.mas_equalTo(self)setOffset:-10];
        make.centerY.mas_equalTo(self.allClickBtn);
        make.size.mas_equalTo(CGSizeMake(70, 30));
    }];
    
}

//点击全选按钮
-(void)allClick:(UIButton *)sender{
    sender.selected = !sender.selected;
    if(sender.selected){
        [sender setImage:[UIImage imageNamed:@"clicked_icon"] forState:UIControlStateNormal];
        [sender setImageEdgeInsets:UIEdgeInsetsMake(9, 4, 9, 4)];
    }else{
        [sender setImage:[UIImage imageNamed:@"unClick_icon"] forState:UIControlStateNormal];
        [sender setImageEdgeInsets:UIEdgeInsetsMake(11, 6, 11, 6)];
    }
    if (self.AllClickBlock) {
        self.AllClickBlock(sender.selected);
    }
}

//赋值
- (void)setIsClick:(BOOL)isClick {
    _isClick = isClick;
    self.allClickBtn.selected = isClick;
    if (isClick) {
        [self.allClickBtn setImage:[UIImage imageNamed:@"clicked_icon"] forState:(UIControlStateNormal)];
        [self.allClickBtn setImageEdgeInsets:UIEdgeInsetsMake(9, 4, 9, 4)];
    } else {
        [self.allClickBtn setImage:[UIImage imageNamed:@"unClick_icon"] forState:(UIControlStateNormal)];
        [self.allClickBtn setImageEdgeInsets:UIEdgeInsetsMake(11, 6, 11, 6)];
    }
}

@end
