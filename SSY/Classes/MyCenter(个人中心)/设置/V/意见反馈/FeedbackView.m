//
//  FeedbackView.m
//  SSY
//
//  Created by 大为科技 on 2018/8/30.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "FeedbackView.h"

@implementation FeedbackView

#pragma mark - init
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
    _tipsLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, TopHeight, ScreenW-30, 50)];
    _tipsLabel.text = @"请填写问题描述";
    _tipsLabel.font = PFR13Font;
    _tipsLabel.textColor = RGB(16, 0, 0);
    [self addSubview:_tipsLabel];
    
    _bgView = [[UIView alloc] init];
    _bgView.backgroundColor = RGB(244, 244, 244);
    _bgView.layer.cornerRadius = 8;
    _bgView.clipsToBounds = YES;
    [self addSubview:_bgView];
    
    _textView = [[UITextView alloc] init];
    _textView.text = @"";
    _textView.font = PFR13Font;
    _textView.textColor = RGB(16, 0, 0);
    [_textView setEditable:YES];
    _textView.scrollEnabled = YES;
    _textView.alpha = 1.0;
    _textView.backgroundColor = RGB(244, 244, 244);
    _textView.delegate = self;
    
    _textView.dataDetectorTypes = UIDataDetectorTypeAll;
    _textView.keyboardType = UIKeyboardTypeDefault;
    _textView.returnKeyType = UIReturnKeySearch;
    [self textViewDidChange:_textView];
    [_bgView addSubview:_textView];
    
    _placeHolderLabel = [[UILabel alloc] init];
    _placeHolderLabel.text = @"请再次输入你的宝贵意见";
    _placeHolderLabel.font = PFR13Font;
    _placeHolderLabel.textColor = RGB(115, 115, 115);
    [_textView addSubview:_placeHolderLabel];
    
    
    _numLabel = [[UILabel alloc] init];
    _numLabel.text = @"0/300";
    _numLabel.font = PFR13Font;
    _numLabel.textColor = RGB(115, 115, 115);
    [_bgView addSubview:_numLabel];
    
    _tabBarView = [[UIView alloc] init];
    _tabBarView.backgroundColor = MColor;
    [self addSubview:_tabBarView];
    
    _submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_submitBtn setTitle:@"提交反馈" forState:UIControlStateNormal];
    [_submitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _submitBtn.titleLabel.font = PFR14Font;
    _submitBtn.backgroundColor = MColor;
    
    [_submitBtn addTarget:self action:@selector(submitClick:) forControlEvents:UIControlEventTouchUpInside];
    [_tabBarView addSubview:_submitBtn];
    
}

#pragma mark - 布局
-(void)layoutSubviews{
    [super layoutSubviews];
    
    [_tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(ScreenW-30);
        make.centerX.mas_equalTo(self);
        make.height.mas_equalTo(50);
    }];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.top.mas_equalTo(self.tipsLabel.mas_bottom)setOffset:0];
        make.centerX.mas_equalTo(self);
        make.width.mas_equalTo(ScreenW-30);
        make.height.mas_equalTo(150);
    }];
    
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.top.mas_equalTo(self.bgView.mas_top)setOffset:5];
        make.width.mas_equalTo(ScreenW-40);
        [make.bottom.mas_equalTo(self.bgView.mas_bottom)setOffset:-40];
        make.centerX.mas_equalTo(self.bgView);
    }];
    
    [_placeHolderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.top.mas_equalTo(self.textView.mas_top)setOffset:7];
        make.left.mas_equalTo(4);
    }];
    
    [_numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.bottom.mas_equalTo(self.bgView.mas_bottom)setOffset:-8];
        [make.right.mas_equalTo(self.bgView.mas_right)setOffset:-8];
    }];
    
    [_tabBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.bottom.mas_equalTo(self.mas_bottom)setOffset:0];
        make.left.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(ScreenW, TabBarHeight));
    }];
    
    [_submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(ScreenW, 44));
    }];
}

#pragma mark ---代理

- (void)textViewDidChange:(UITextView *)textView{
    
    if (textView.text.length == 0 ){
        _placeHolderLabel.text = @"请再次输入你的宝贵意见";
        self.numLabel.text = @"0/300";
    }else{
        _placeHolderLabel.text = @"";
        self.numLabel.text = [NSString stringWithFormat:@"%lu/300",textView.text.length];
    }
    
}


//提交
-(void)submitClick:(UIButton *)sender{
    if(self.submitBtn){
        self.submitClickBlock(self.textView.text);
    }
}

@end
