//
//  registerGroupView.m
//  SSY
//
//  Created by 大为科技 on 2018/8/21.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "registerGroupView.h"

@implementation registerGroupView

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
    //手机号
    _userPhone = [[UITextField alloc]init];
    _userPhone.placeholder = @"输入手机号";
    _userPhone.font = PFR13Font;
    [self setBottomLIneWithTextField:_userPhone];
    
    UILabel *areaCodeLabel = [[UILabel alloc] init];
    areaCodeLabel.frame = CGRectMake(0, 0, 40, 40);
    areaCodeLabel.text = @"+86";
    areaCodeLabel.font = PFR13Font;
    
    UIView *rightLineView = [[UIView alloc] initWithFrame:CGRectMake(30, 12, 1, 16)];
    rightLineView.backgroundColor = [UIColor grayColor];
    [areaCodeLabel addSubview:rightLineView];
    _userPhone.leftView = areaCodeLabel;
    _userPhone.leftViewMode = UITextFieldViewModeAlways;
    _userPhone.delegate = self;
    [_userPhone addTarget:self action:@selector(textFieldDidBeginEditing:) forControlEvents:UIControlEventEditingChanged];
    [self addSubview:_userPhone];
    //验证码
    _codeNum = [[UITextField alloc] init];
    _codeNum.placeholder = @"输入验证码";
    _codeNum.font = PFR13Font;
    [self setBottomLIneWithTextField:_codeNum];
    
    _getCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _getCodeBtn.frame = CGRectMake(0, 0, 80, 25);
    [_getCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    _getCodeBtn.layer.cornerRadius = 12.5;
    _getCodeBtn.backgroundColor = RGB(155, 155, 155);
    _getCodeBtn.userInteractionEnabled = NO;
    _getCodeBtn.titleLabel.font = PFR10Font;
    [_getCodeBtn addTarget:self action:@selector(getCodeClick:) forControlEvents:UIControlEventTouchUpInside];
    _codeNum.rightView = _getCodeBtn;
    _codeNum.rightViewMode = UITextFieldViewModeAlways;
    _codeNum.delegate = self;
    [_codeNum addTarget:self action:@selector(textFieldDidBeginEditing:) forControlEvents:UIControlEventEditingChanged];
    [self addSubview:_codeNum];
    //输入密码
    _userPawd = [[UITextField alloc] init];
    _userPawd.placeholder = @"输入密码";
    _userPawd.font = PFR13Font;
    [self setBottomLIneWithTextField:_userPawd];
    _userPawd.delegate = self;
    [_userPawd addTarget:self action:@selector(textFieldDidBeginEditing:) forControlEvents:UIControlEventEditingChanged];
    [self addSubview:_userPawd];
    //确认密码
    _truePawd = [[UITextField alloc] init];
    _truePawd.placeholder = @"确认密码";
    _truePawd.font = PFR13Font;
    [self setBottomLIneWithTextField:_truePawd];
    _truePawd.delegate = self;
    [_truePawd addTarget:self action:@selector(textFieldDidBeginEditing:) forControlEvents:UIControlEventEditingChanged];
    [self addSubview:_truePawd];
    
    //注册按钮
    _buttonView = [[UIView alloc] init];
    _buttonView.layer.borderWidth = 1.0;
    _buttonView.layer.borderColor =  [UIColor colorWithRed:72/255.0 green:188/255.0 blue:119/255.0 alpha:0.4].CGColor;
    _buttonView.layer.cornerRadius = 20.0;
    
    _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _registerBtn.userInteractionEnabled  = NO;//设置那妞不可以点击
    [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    _registerBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
    [_registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _registerBtn.backgroundColor =  MColor4;
    _registerBtn.layer.cornerRadius = 18.0;
    [_buttonView addSubview:_registerBtn];
    [_registerBtn addTarget:self action:@selector(registerClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_buttonView];
    //登录按钮
    _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_loginBtn setTitle:@"已有账号？立即登录" forState:UIControlStateNormal];
    _loginBtn.titleLabel.font = PFR14Font;
    [_loginBtn setTitleColor:MColor forState:UIControlStateNormal];
    [self setBottomLIneWithUIButton:_loginBtn];
    [_loginBtn addTarget:self action:@selector(loginClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_loginBtn];
    
}

#pragma mark - 布局
-(void)layoutSubviews{
    [super layoutSubviews];
    [_buttonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.centerY.mas_equalTo(self.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(230, 40));
    }];
    [_registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(226, 36));
        make.center.mas_equalTo(self.buttonView);
    }];
    
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.top.mas_equalTo(self.buttonView.mas_bottom)setOffset:65];
        make.centerX.mas_equalTo(self);
    }];
    
    [_truePawd mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.bottom.mas_equalTo(self.buttonView.mas_top)setOffset:-56];
        make.width.mas_equalTo(self.buttonView.mas_width);
        make.height.mas_equalTo(@40);
        make.centerX.mas_equalTo(self);
    }];
    
    [_userPawd mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.bottom.mas_equalTo(self.truePawd.mas_top)setOffset:0];
        make.width.mas_equalTo(self.buttonView.mas_width);
        make.height.mas_equalTo(@40);
        make.centerX.mas_equalTo(self);
    }];
    
    [_codeNum mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.bottom.mas_equalTo(self.userPawd.mas_top)setOffset:0];
        make.width.mas_equalTo(self.buttonView.mas_width);
        make.height.mas_equalTo(@40);
        make.centerX.mas_equalTo(self);
    }];
    
    [_userPhone mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.bottom.mas_equalTo(self.codeNum.mas_top)setOffset:0];
        make.width.mas_equalTo(self.buttonView.mas_width);
        make.height.mas_equalTo(@40);
        make.centerX.mas_equalTo(self);
    }];
    
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

/*---------------------------代理-----------------------------------*/
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if(_userPhone.text.length == 0){
        _getCodeBtn.backgroundColor = RGB(155, 155, 155);
        _getCodeBtn.userInteractionEnabled = NO;
    }else{
        _getCodeBtn.backgroundColor = MColor;
        _getCodeBtn.userInteractionEnabled = YES;
        if(_codeNum.text.length != 0 &&_userPawd.text.length != 0 && _truePawd.text.length !=0){
            _registerBtn.userInteractionEnabled = YES;
            _registerBtn.backgroundColor = MColor;
            _buttonView.layer.borderColor =  [UIColor colorWithRed:72/255.0 green:188/255.0 blue:119/255.0 alpha:1.0f].CGColor;
            
        }else{
            _registerBtn.userInteractionEnabled = NO;
            _registerBtn.backgroundColor = MColor4;
            _buttonView.layer.borderColor =  [UIColor colorWithRed:72/255.0 green:188/255.0 blue:119/255.0 alpha:0.4].CGColor;
            
        }
    }
}

//--------------------------action事件------------------------------
//获取验证码
-(void)getCodeClick:(UIButton *)sender{
    if(self.getCodeBtn){
        self.GetCodeClickBlock(self.userPhone.text);
        [self startTime:sender];
    }
}
//注册
-(void)registerClick:(UIButton *)sender{
    if(self.registerBtn){
        if(_codeNum.text.length != 0 &&_userPawd.text.length != 0 && _truePawd.text.length !=0){
            self.RegisterClickBlock();
        }
    }
}
//返回登录
-(void)loginClick:(UIButton *)sender{
    if(self.loginBtn){
        self.LoginClickBlock();
    }
}



// 开启倒计时效果
-(void)startTime:(UIButton *)sender{
    
    __block int timeout= 59; //倒计时时间
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{
        
        if(timeout<=0){ //倒计时结束，关闭
            
            dispatch_source_cancel(_timer);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置界面的按钮显示 根据自己需求设置
                
                [sender setTitle:@"获取验证码" forState:UIControlStateNormal];
                sender.backgroundColor = MColor;
                sender.userInteractionEnabled = YES;
                
            });
            
        }else{
            
            int seconds = timeout % 60;
            
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [sender setTitle:[NSString stringWithFormat:@"%@秒后重发",strTime] forState:UIControlStateNormal];
                sender.backgroundColor = RGB(155, 155, 155);
                
                sender.userInteractionEnabled = NO;
                
            });
            
            timeout--;
        }
        
    });
    
    dispatch_resume(_timer);
    
    
    
}


@end
