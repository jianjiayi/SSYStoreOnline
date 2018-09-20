//
//  forgetPawdView.m
//  SSY
//
//  Created by 大为科技 on 2018/8/23.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "forgetPawdView.h"

@implementation forgetPawdView

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
    _locationLabel.text = @"验证身份 > 忘记密码";
    [self addSubview:_locationLabel];
    
    //手机号
    _leftView = [[UIView alloc] init];
    _leftView.frame = CGRectMake(0, 0, 80, 50);
    UILabel *textLabel = [[UILabel alloc] init];
    textLabel.font = PFR14Font;
    textLabel.textColor = RGB(16, 0, 0);
    textLabel.text = @"手机号 :";
    textLabel.frame = CGRectMake(20, 3, 60, 40);
    [_leftView addSubview:textLabel];
    _phoneTextField = [[UITextField alloc] init];
    _phoneTextField.font = PFR13Font;
    _phoneTextField.textColor = RGB(16, 0, 0);
    _phoneTextField.placeholder = @"请输入手机号";
    _phoneTextField.backgroundColor = [UIColor whiteColor];
    _phoneTextField.delegate = self;
    [_phoneTextField addTarget:self action:@selector(textFieldDidBeginEditing:) forControlEvents:UIControlEventEditingChanged];
    _phoneTextField.leftView = _leftView;
    _phoneTextField.leftViewMode = UITextFieldViewModeAlways;
    //线
    _bottomLineView = [[UIView alloc] init];
    _bottomLineView.backgroundColor = RGB(244, 244, 244);
    [_phoneTextField addSubview:_bottomLineView];
    [self addSubview:_phoneTextField];
    
    //验证码
    _codeTextField = [[UITextField alloc] init];
    _codeTextField.font = PFR13Font;
    _codeTextField.textColor = RGB(16, 0, 0);
    _codeTextField.placeholder = @"请输入验证码";
    _codeTextField.backgroundColor = [UIColor whiteColor];
    _codeTextField.delegate = self;
    
    UIView *leftBaceView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 50)];;
    _codeTextField.leftView = leftBaceView;
    _codeTextField.leftViewMode = UITextFieldViewModeAlways;
    
    //获取验证码按钮
    _getCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_getCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    _getCodeBtn.titleLabel.font = PFR13Font;
    [_getCodeBtn setTitleColor:RGB(16, 0, 0) forState:UIControlStateNormal];
    UIView *leftLineView = [[UIView alloc] initWithFrame:CGRectMake(8, 15, 1, 20)];
    leftLineView.backgroundColor = [UIColor grayColor];
    [_getCodeBtn addSubview:leftLineView];
    _getCodeBtn.frame = CGRectMake(0, 0, 120, 50);
    [_getCodeBtn addTarget:self action:@selector(getCodeClick:) forControlEvents:UIControlEventTouchUpInside];
    _codeTextField.rightView = _getCodeBtn;
    _codeTextField.rightViewMode = UITextFieldViewModeAlways;
    _codeTextField.delegate = self;
    [_codeTextField addTarget:self action:@selector(textFieldDidBeginEditing:) forControlEvents:UIControlEventEditingChanged];
    [self addSubview:_codeTextField];
    //下一步按钮
    _nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [_nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _nextBtn.backgroundColor = RGB(237, 237, 237);
    _nextBtn.layer.cornerRadius = 20.0;
    _nextBtn.userInteractionEnabled = NO;
    [_nextBtn addTarget:self action:@selector(nextClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_nextBtn];
}

#pragma mark - 布局
-(void)layoutSubviews{
    [super layoutSubviews];
    
    [_locationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(40);
    }];
    
    [_phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.top.mas_equalTo(self.locationLabel.mas_bottom)setOffset:0];
        make.left.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(ScreenW, 50));
    }];
    
    [_bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.bottom.mas_equalTo(self.phoneTextField.mas_bottom)setOffset:-1];
        make.width.mas_equalTo(ScreenW-20);
        make.height.mas_equalTo(1);
        [make.left.mas_equalTo(self.phoneTextField)setOffset:20];
    }];
    
    [_codeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.top.mas_equalTo(self.phoneTextField.mas_bottom)setOffset:0];
        make.size.mas_equalTo(CGSizeMake(ScreenW, 50));
        make.left.mas_equalTo(0);
    }];
    
    [_nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.top.mas_equalTo(self.codeTextField.mas_bottom)setOffset:50];
        make.centerX.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(ScreenW-40, 40));
    }];
    
    
}


#pragma mark -------------------------------- 代理 <UITextFieldDelage> -------------------
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if(self.phoneTextField.text.length !=0 && self.codeTextField.text.length !=0){
        self.nextBtn.backgroundColor = MColor;
        self.nextBtn.userInteractionEnabled = YES;
    }else{
        self.nextBtn.backgroundColor = RGB(237, 237, 237);
        self.nextBtn.userInteractionEnabled = NO;
    }
}

//获取验证码
-(void)getCodeClick:(UIButton *)sender{
    if(self.getCodeBtn){
        if(self.phoneTextField.text.length !=0){
            self.GetCodeCLickBlock(self.phoneTextField.text);
            [self startTime:sender];
        }else{
            NSLog(@"没有输入手机号");
        }
        
    }
}



//next下一步
-(void)nextClick:(UIButton *)sender{
    if(self.nextBtn){
        self.NextClickBlock();
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
                [sender setTitleColor:RGB(16, 0, 0) forState:UIControlStateNormal];
                sender.userInteractionEnabled = YES;
                
            });
            
        }else{
            
            int seconds = timeout % 60;
            
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [sender setTitle:[NSString stringWithFormat:@"%@秒后重发",strTime] forState:UIControlStateNormal];
                [sender setTitleColor:RGB(155, 155, 155) forState:UIControlStateNormal];
                
                sender.userInteractionEnabled = NO;
                
            });
            
            timeout--;
        }
        
    });
    
    dispatch_resume(_timer);
    
    
    
}


@end
