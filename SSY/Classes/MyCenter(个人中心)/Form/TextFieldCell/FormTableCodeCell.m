//
//  FormTableCodeCell.m
//  SSY
//
//  Created by 大为科技 on 2018/9/4.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "FormTableCodeCell.h"

@implementation FormTableCodeCell

#pragma mark -init
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self setUpUI];
    }
    return self;
}

#pragma mark - UI
-(void)setUpUI{
    _codeTextField = [[UITextField alloc] init];
    _codeTextField.font = PFR13Font;
    _codeTextField.textColor = RGB(16, 0, 0);
    [self addSubview:_codeTextField];
    
    _getCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_getCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_getCodeBtn setTitleColor:RGB(16, 0, 0) forState:UIControlStateNormal];
    _getCodeBtn.titleLabel.font = PFR13Font;
    UIView *leftLineView = [[UIView alloc] init];
    leftLineView.frame = CGRectMake(0, 10, 1, 13);
    leftLineView.backgroundColor = RGB(115, 115, 115);
    [_getCodeBtn addSubview:leftLineView];
    
    [_getCodeBtn addTarget:self action:@selector(getCodeClick:) forControlEvents:UIControlEventTouchUpInside];
    //    _getCodeBtn.userInteractionEnabled = NO;
    [self addSubview:_getCodeBtn];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldValueChanged:) name:UITextFieldTextDidChangeNotification object:self.codeTextField];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getNotificationAction:) name:@"ThisIsANoticafication" object:nil];
}
#pragma mark - 布局
-(void)layoutSubviews{
    [super layoutSubviews];
    
    [_codeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.centerY.mas_equalTo(self);
    }];
    
    [_getCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.right.mas_equalTo(self.mas_right)setOffset:-10];
        make.centerY.mas_equalTo(self);
        make.width.mas_equalTo(90);
    }];
}

#pragma mark -codeTextField添加回调
- (void)textFieldAddObserver:(id)observer selector:(SEL)selector
{
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:selector name:UITextFieldTextDidChangeNotification object:self.codeTextField];
}
#pragma mark - getCodeBtn
-(void)getNotificationAction:(NSNotification *)notification{
    [self startTime:self.getCodeBtn];
}
//设置数据模型
-(void)setCreatTableModel:(FormTableModel *)CreatTableModel
{
    _creatTableModel = CreatTableModel;
    self.codeTextField.placeholder = CreatTableModel.placeholder;
}
//保存数据
-(void)setFormDict:(NSDictionary *)formDict{
    _formDict = formDict;
    self.codeTextField.text  = [formDict valueForKey:self.creatTableModel.key];
}
//点击事件
-(void)getCodeClick:(UIButton *)sender{
    if(self.getCodeBtn){
        self.GetCodeClickBlock();
    }
}

-(void)textFieldValueChanged:(NSNotification *)note
{
    if(!self.creatTableModel){
        return;
    }
    [self.formDict setValue:self.codeTextField.text forKey:self.creatTableModel.key];
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

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    
}


@end
