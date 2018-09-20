//
//  mineTopToolView.m
//  SSY
//
//  Created by 大为科技 on 2018/8/1.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "mineTopToolView.h"

@implementation mineTopToolView

#pragma mark - Intail
-(instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self setUpUI];
    }
    return self;
}

-(void)setUpUI{
    _settingItemButton = [[UIButton alloc] init];
    [_settingItemButton setImage:[UIImage imageNamed:@"MYshezhi_icon"] forState:UIControlStateNormal];
    [_settingItemButton addTarget:self action:@selector(settingItemButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    _messageItemButton = [[UIButton alloc] init];
    [_messageItemButton setImage:[UIImage imageNamed:@"MYxiaoxi_icon"]forState:UIControlStateNormal];
    [_messageItemButton addTarget:self action:@selector(messageItemButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:self.settingItemButton];
    [self addSubview:self.messageItemButton];
    
}


#pragma mark 布局
-(void)layoutSubviews
{
    [super layoutSubviews];
    [_messageItemButton mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.mas_top).offset(0);
        [make.right.mas_equalTo(self.mas_right)setOffset:0];
        make.size.mas_equalTo(CGSizeMake(44, 44));
    }];
    
    [_settingItemButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.messageItemButton);
        [make.right.mas_equalTo(self.messageItemButton.mas_left)setOffset:-10];
        make.size.mas_equalTo(CGSizeMake(44, 44));
    }];
}

#pragma 自定义按钮点击
-(void)settingItemButtonClick{
    if(self.settingItemButton){
        self.SettingClickBlock();
    }
}
-(void)messageItemButtonClick{
    if(self.messageItemButton){
        self.MessageClickBlock();
    }
}



@end
