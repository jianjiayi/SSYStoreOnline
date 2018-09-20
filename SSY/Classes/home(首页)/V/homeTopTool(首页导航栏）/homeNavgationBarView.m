//
//  homeNavgationBarView.m
//  SSY
//
//  Created by 大为科技 on 2018/8/2.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "homeNavgationBarView.h"

@implementation homeNavgationBarView

#pragma mark - Intial
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self setUpUI];
    }
    return self;
}

#pragma mark - 创建UI
-(void)setUpUI{
    self.backgroundColor = [UIColor clearColor];
    //右侧消息点击按钮
    _rightItemButton = ({
        UIButton *button = [UIButton new];
        [button setImage:[UIImage imageNamed:@"icon_message@2x"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(rightButtonClick) forControlEvents:UIControlEventTouchUpInside];
        button;
    });
    [self addSubview:_rightItemButton];
    //搜索框view
    _topSearchView = [[UIView alloc] init];
    _topSearchView.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1/1.0];
    _topSearchView.layer.cornerRadius = 16;
    [_topSearchView.layer masksToBounds];
    [self addSubview:_topSearchView];
    //搜索按钮
    _searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_searchButton setTitle:@"输入商品和商家" forState:0];
    [_searchButton setTitleColor:[UIColor lightGrayColor] forState:0];
    _searchButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
    [_searchButton setImage:[UIImage imageNamed:@"icon_search@2x"] forState:0];
    [_searchButton adjustsImageWhenHighlighted];
    
    _searchButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _searchButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    _searchButton.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    
    [_searchButton addTarget:self action:@selector(searchButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [_topSearchView addSubview:_searchButton];
    
}

#pragma mark - 布局
-(void)layoutSubviews{
    [super layoutSubviews];
    
    [_rightItemButton mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.mas_top).offset(20);
        make.right.equalTo(self.mas_right).offset(-0);
        make.height.equalTo(@44);
        make.width.equalTo(@44);
    }];
    
    [_topSearchView mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.mas_left).offset(10);
        [make.right.mas_equalTo(self.rightItemButton.mas_left)setOffset:-0];
        make.height.mas_equalTo(@(32));
        make.centerY.mas_equalTo(self.rightItemButton);
    }];
    
    [_searchButton mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(self.topSearchView);
        make.top.mas_equalTo(self.topSearchView);
        make.height.mas_equalTo(self.topSearchView);
        [make.right.mas_equalTo(self.topSearchView)setOffset:20];
    }];
    
}

#pragma mark -点击事件

//右边按钮点击
-(void)rightButtonClick{
    !_rightItemClickBlock ? : _rightItemClickBlock();
}
//搜索按钮点击
-(void)searchButtonClick{
    !_searchButtonClickBlock ? : _searchButtonClickBlock();
}

@end
