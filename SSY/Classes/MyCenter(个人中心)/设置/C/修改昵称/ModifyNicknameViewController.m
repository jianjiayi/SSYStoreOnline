//
//  ModifyNicknameViewController.m
//  SSY
//
//  Created by 大为科技 on 2018/8/29.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "ModifyNicknameViewController.h"

@interface ModifyNicknameViewController ()

@end

@implementation ModifyNicknameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpBase];
    
    [self setUpUI];
}

#pragma mark - init
-(void)setUpBase{
    self.title = @"修改昵称";
    self.view.backgroundColor = RGB(244, 244, 244);
    
    //添加保存按钮
    UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    saveBtn.frame = CGRectMake(0, 0, 44, 44);
//    saveBtn.backgroundColor = [UIColor redColor];
    [saveBtn setTitle:@"保存" forState:UIControlStateNormal];
    [saveBtn setTitleColor:RGB(102, 102, 102) forState:UIControlStateNormal];
    saveBtn.titleLabel.font = PFR16Font;
    [saveBtn addTarget:self action:@selector(saveNickNameClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithCustomView:saveBtn];
    self.navigationItem.rightBarButtonItem = rightBtn;
}

#pragma mark - UI
-(void)setUpUI{
    _textView = [[UIView alloc] init];
    _textView.backgroundColor = [UIColor whiteColor];
    _nickNameTextField = [[UITextField alloc] init];
    _nickNameTextField.font = PFR13Font;
    _nickNameTextField.textColor = RGB(16, 0, 0);
    _nickNameTextField.text = @"13121378101";
    [_textView addSubview:_nickNameTextField];
    [self.view addSubview:_textView];
    
    _tipsLabel = [[UILabel alloc] init];
    _tipsLabel.font = PFR13Font;
    _tipsLabel.textColor = RGB(155, 155, 155);
    _tipsLabel.text = @"可由中英文、数字、符号“_”组成";
    [self.view addSubview:_tipsLabel];
    
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(TopHeight);
        make.left.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(ScreenW, 60));
    }];
    [_nickNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(ScreenW-30);
        make.center.mas_equalTo(self.textView);
    }];
    [_tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.top.mas_equalTo(self.textView.mas_bottom)setOffset:15];
        make.left.mas_equalTo(15);
    }];

}

#pragma mark - loadData
-(void)loadData{
    
}

-(void)setNickNameBlock:(void (^)(NSString *))NickNameBlock
{
    
}

#pragma mark -保存昵称
-(void)saveNickNameClick{
    if(self.nickNameTextField.text.length ==0){
        
    }else{
        NSLog(@"保存修改");
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
