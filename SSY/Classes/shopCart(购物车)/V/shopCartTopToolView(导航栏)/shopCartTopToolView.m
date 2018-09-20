//
//  shopCartTopToolView.m
//  SSY
//
//  Created by 大为科技 on 2018/8/15.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "shopCartTopToolView.h"

@implementation shopCartTopToolView

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
    //title
    _titlelabel = [[UILabel alloc] init];
    _titlelabel.text = @"购物蓝";
    _titlelabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:16];
    _titlelabel.textColor = [UIColor colorWithRed:16/255.0 green:0/255.0 blue:0/255.0 alpha:1/1.0];
    [self addSubview:_titlelabel];
    //消息
    _messageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _messageBtn.contentMode = UIViewContentModeScaleAspectFill;
    [_messageBtn setImage:[UIImage imageNamed:@"icon_message@2x"] forState:UIControlStateNormal];
    [self addSubview:_messageBtn];
    //编辑
    _editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _editBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
    [_editBtn setTitle:@"编辑" forState:UIControlStateNormal];
    [_editBtn setTitleColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1/1.0] forState:UIControlStateNormal];
    [_editBtn addTarget:self action:@selector(editClickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_editBtn];
}

#pragma mark - 布局
-(void)layoutSubviews{
    [super layoutSubviews];
    
    [_titlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.height.mas_equalTo(44);
        make.top.mas_equalTo(StatusBarHeight);
    }];
    
    [_messageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.titlelabel);
        [make.right.mas_equalTo(self.mas_right)setOffset:0];
        make.size.mas_equalTo(CGSizeMake(44, 44));
    }];
    
    [_editBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.messageBtn);
        [make.right.mas_equalTo(self.messageBtn.mas_left)setOffset:-10];
        make.height.mas_equalTo(44);
    }];
}

//编辑按钮
-(void)editClickBtn:(UIButton *)sender{
    sender.selected = !sender.selected;
    if(sender.selected){
        [sender setTitle:@"完成" forState:UIControlStateNormal];
    }else{
        [sender setTitle:@"编辑" forState:UIControlStateNormal];
    }
    
    if(self.EditClickBlock){
        self.EditClickBlock(sender.selected);
    }
}

@end
