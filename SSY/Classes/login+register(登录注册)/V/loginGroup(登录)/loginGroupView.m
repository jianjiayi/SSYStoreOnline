//
//  loginGroupView.m
//  SSY
//
//  Created by 大为科技 on 2018/8/20.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "loginGroupView.h"

@interface loginGroupView()<UITextFieldDelegate>

@end

@implementation loginGroupView

#pragma mark -init
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self setUpUI];
    }
    return self;
}

#pragma mark - UI
-(void)setUpUI{
    //用户名
    _userNameField = [[UITextField alloc] init];
    _userNameField.placeholder = @"请输入手机号";
    _userNameField.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
    [self setLeftViewWithTextField:_userNameField imaageName:@"Luser_icon"];
    [self setBottomLIneWithTextField:_userNameField];
    _userNameField.delegate = self;
    [_userNameField addTarget:self action:@selector(textFieldDidBeginEditing:) forControlEvents:UIControlEventEditingChanged];
    [self addSubview:_userNameField];
    //密码
    _userPawdField = [[UITextField alloc] init];
    _userPawdField.placeholder = @"请输入密码";
    _userPawdField.secureTextEntry = YES;//暗文
    _userPawdField.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
    [self setLeftViewWithTextField:_userPawdField imaageName:@"Lpawd_icon"];
    [self setBottomLIneWithTextField:_userPawdField];
    _userPawdField.delegate = self;
    [_userPawdField addTarget:self action:@selector(textFieldDidBeginEditing:) forControlEvents:UIControlEventEditingChanged];
    
    //眼睛
    _eyeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_eyeBtn setImage:[UIImage imageNamed:@"eye_off"] forState:UIControlStateNormal];
    _eyeBtn.frame = CGRectMake(0, 0, 30, 20);
    _eyeBtn.contentMode = UIViewContentModeScaleAspectFit;
    [_eyeBtn setImageEdgeInsets:UIEdgeInsetsMake(8, 9, 8, 9)];
    [_eyeBtn addTarget:self action:@selector(visiblePWBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    _userPawdField.rightView = _eyeBtn;
    _userPawdField.rightViewMode = UITextFieldViewModeAlways;
    
    [self addSubview:_userPawdField];
   
    //忘记密码
    _forgetPawdBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_forgetPawdBtn setTitle:@"忘记密码？" forState:UIControlStateNormal];
    _forgetPawdBtn.titleLabel.font = PFR12Font;
    [_forgetPawdBtn setTitleColor:MColor forState:UIControlStateNormal];
    [_forgetPawdBtn addTarget:self action:@selector(forgetClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_forgetPawdBtn];
    //登录按钮
    _loginLineView = [[UIView alloc] init];
    _loginLineView.layer.borderWidth = 1.0;
    _loginLineView.layer.borderColor =  [UIColor colorWithRed:72/255.0 green:188/255.0 blue:119/255.0 alpha:0.4].CGColor;
    _loginLineView.layer.cornerRadius = 20.0;
    
    _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _loginBtn.enabled  = NO;//设置那妞不可以点击
    [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    _loginBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
    [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _loginBtn.backgroundColor =  MColor4;
    _loginBtn.layer.cornerRadius = 18.0;
    [_loginLineView addSubview:_loginBtn];
    [_loginBtn addTarget:self action:@selector(loginClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_loginLineView];
    //注册按钮
    _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_registerBtn setTitle:@"立即注册" forState:UIControlStateNormal];
    _registerBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    [_registerBtn setTitleColor:[UIColor colorWithRed:72/255.0 green:188/255.0 blue:119/255.0 alpha:1/1.0] forState:UIControlStateNormal];
    [self setBottomLIneWithUIButton:_registerBtn];
    [_registerBtn addTarget:self action:@selector(registerClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_registerBtn];
   
    
}

#pragma mark - 布局
-(void)layoutSubviews{
    [super layoutSubviews];
    
    [_loginLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.centerY.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(230, 40));
    }];
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(226, 36));
        make.center.mas_equalTo(self.loginLineView);
    }];
    
    [_registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.top.mas_equalTo(self.loginLineView.mas_bottom)setOffset:65];
        make.centerX.mas_equalTo(self);
    }];
    
    [_forgetPawdBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.bottom.mas_equalTo(self.loginLineView.mas_top)setOffset:-45];
        [make.right.mas_equalTo(self.loginLineView.mas_right)setOffset:0];
    }];
    
    [_userPawdField mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.bottom.mas_equalTo(self.forgetPawdBtn.mas_top)setOffset:-10];
        make.size.mas_equalTo(CGSizeMake(230, 40));
        make.centerX.mas_equalTo(self);
    }];
    
    [_userNameField mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.bottom.mas_equalTo(self.userPawdField.mas_top)setOffset:-10];
        make.size.mas_equalTo(CGSizeMake(230, 40));
        make.centerX.mas_equalTo(self);
    }];
    
}

#pragma mark ---------------------<UITextFieldDelegate>------------------------
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if(_userNameField.text.length != 0 && _userPawdField.text.length != 0){
        _loginBtn.enabled = YES;
        _loginBtn.backgroundColor = MColor;
        _loginLineView.layer.borderColor =  [UIColor colorWithRed:72/255.0 green:188/255.0 blue:119/255.0 alpha:1.0f].CGColor;
        
    }else{
        _loginBtn.enabled = NO;
        _loginBtn.backgroundColor = MColor4;
        _loginLineView.layer.borderColor =  [UIColor colorWithRed:72/255.0 green:188/255.0 blue:119/255.0 alpha:0.4].CGColor;
        
    }
}

//忘记密码
-(void)forgetClick:(UIButton *)sender{
    if(self.forgetPawdBtn){
        self.ForgetClickBlock(self.userNameField.text);
    }
}
//登录
-(void)loginClick:(UIButton *)sender{
    if(self.loginBtn){
        self.LoginClickBlock();
    }
}
//注册
-(void)registerClick:(UIButton *)sender{
    if(self.registerBtn){
        self.RegisterClickBlock();
    }
}


//切换密码明文与暗文
- (void)visiblePWBtnAction:(UIButton *)sender
{
    sender.selected = !sender.selected;
    if(sender.selected){//明文
        [sender setImage:[UIImage imageNamed:@"eye_on"] forState:UIControlStateNormal];
        [sender setImageEdgeInsets:UIEdgeInsetsMake(7, 9, 7, 9)];
        
        NSString *tempPwdStr = self.userPawdField.text;
        self.userPawdField.text = @"";//这句话防止光标偏移
        self.userPawdField.secureTextEntry = NO;
        self.userPawdField.text = tempPwdStr;
    }else{//暗文
        [sender setImage:[UIImage imageNamed:@"eye_off"] forState:UIControlStateNormal];
        [sender setImageEdgeInsets:UIEdgeInsetsMake(7, 9, 7, 9)];
        
        NSString *tempPwdStr = self.userPawdField.text;
        self.userPawdField.text = @"";
        self.userPawdField.secureTextEntry = YES;
        self.userPawdField.text = tempPwdStr;
    }
}


//设置输入框左侧图标
-(void)setLeftViewWithTextField:(UITextField *)textField imaageName:(NSString *)imageName{
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(8, 8, 20, 20);
    imageView.image = [UIImage imageNamed:imageName];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.clipsToBounds = YES;
    [leftView addSubview:imageView];
    textField.leftView = leftView;
    textField.leftViewMode = UITextFieldViewModeAlways;
   
}
//设置输入框底边线
-(void)setBottomLIneWithTextField:(UITextField *)textField{
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = RGB(205, 205, 205);
    [textField addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(textField.mas_width);
        make.height.mas_equalTo(1);
        [make.bottom.mas_equalTo(textField.mas_bottom)setOffset:-1];
        make.left.mas_equalTo(0);
    }];
}
//设置按钮底边线
-(void)setBottomLIneWithUIButton:(UIButton *)UIButton{
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = MColor;
    [UIButton addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(UIButton.mas_width);
        make.height.mas_equalTo(1);
        [make.bottom.mas_equalTo(UIButton.mas_bottom)setOffset:-1];
        make.left.mas_equalTo(0);
    }];
}




@end
