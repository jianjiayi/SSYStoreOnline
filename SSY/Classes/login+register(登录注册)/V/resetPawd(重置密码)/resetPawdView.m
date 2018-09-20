//
//  resetPawdView.m
//  SSY
//
//  Created by 大为科技 on 2018/8/23.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "resetPawdView.h"

@implementation resetPawdView

#pragma mark - init
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
    //位置
    _locationLabel = [[UILabel alloc] init];
    _locationLabel.font = PFR12Font;
    _locationLabel.textColor = RGB(72, 188, 199);
    _locationLabel.text = @"验证身份 > 设置新密码";
    [self addSubview:_locationLabel];
    
    //手机号
    _pawdTextField = [[UITextField alloc] init];
    _pawdTextField.font = PFR13Font;
    _pawdTextField.textColor = RGB(16, 0, 0);
    _pawdTextField.placeholder = @"输入新密码";
    _pawdTextField.backgroundColor = [UIColor whiteColor];
    _pawdTextField.delegate = self;
    [_pawdTextField addTarget:self action:@selector(textFieldDidBeginEditing:) forControlEvents:UIControlEventEditingChanged];
    [self setLeftViewWithTextField:_pawdTextField LabelText:@"新入密码 :"];
    //线
    _bottomLineView = [[UIView alloc] init];
    _bottomLineView.backgroundColor = RGB(244, 244, 244);
    [_pawdTextField addSubview:_bottomLineView];
    [self addSubview:_pawdTextField];
    
    //确认密码
    _truePAwdTextField = [[UITextField alloc] init];
    _truePAwdTextField.font = PFR13Font;
    _truePAwdTextField.textColor = RGB(16, 0, 0);
    _truePAwdTextField.placeholder = @"确认新密码";
    _truePAwdTextField.backgroundColor = [UIColor whiteColor];
    _truePAwdTextField.delegate = self;
    [_truePAwdTextField addTarget:self action:@selector(textFieldDidBeginEditing:) forControlEvents:UIControlEventEditingChanged];
    [self setLeftViewWithTextField:_truePAwdTextField LabelText:@"确认密码 :"];
    [self addSubview:_truePAwdTextField];
    
    
    //下一步按钮
    _submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_submitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [_submitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _submitBtn.backgroundColor = RGB(237, 237, 237);
    _submitBtn.layer.cornerRadius = 20.0;
    _submitBtn.userInteractionEnabled = NO;
    [_submitBtn addTarget:self action:@selector(resetClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_submitBtn];
}

#pragma mark - 布局
-(void)layoutSubviews{
    [super layoutSubviews];
    
    [_locationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(40);
    }];
    
    [_pawdTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.top.mas_equalTo(self.locationLabel.mas_bottom)setOffset:0];
        make.left.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(ScreenW, 50));
    }];
    
    [_bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.bottom.mas_equalTo(self.pawdTextField.mas_bottom)setOffset:-1];
        make.width.mas_equalTo(ScreenW-20);
        make.height.mas_equalTo(1);
        [make.left.mas_equalTo(self.pawdTextField)setOffset:20];
    }];
    
    [_truePAwdTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.top.mas_equalTo(self.pawdTextField.mas_bottom)setOffset:0];
        make.size.mas_equalTo(CGSizeMake(ScreenW, 50));
        make.left.mas_equalTo(0);
    }];
    
    [_submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.top.mas_equalTo(self.truePAwdTextField.mas_bottom)setOffset:50];
        make.centerX.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(ScreenW-40, 40));
    }];
    
    
}


#pragma mark -------------------------------- 代理 <UITextFieldDelage> -------------------
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if(self.pawdTextField.text.length !=0 && self.truePAwdTextField.text.length !=0){
        self.submitBtn.backgroundColor = MColor;
        self.submitBtn.userInteractionEnabled = YES;
    }else{
        self.submitBtn.backgroundColor = RGB(237, 237, 237);
        self.submitBtn.userInteractionEnabled = NO;
    }
}

//next下一步
-(void)resetClick:(UIButton *)sender{
    if(self.submitBtn){
        self.ResetClickBlock();
    }
}

//设置输入框左侧图标
-(void)setLeftViewWithTextField:(UITextField *)textField LabelText:(NSString *)text{
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    UILabel *textLabel = [[UILabel alloc] init];
    textLabel.font = PFR14Font;
    textLabel.textColor = RGB(16, 0, 0);
    textLabel.text = text;
    textLabel.frame = CGRectMake(20, 3, 80, 40);
    [leftView addSubview:textLabel];
    textField.leftView = leftView;
    textField.leftViewMode = UITextFieldViewModeAlways;
}

@end
