//
//  loginGroupView.h
//  SSY
//
//  Created by 大为科技 on 2018/8/20.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface loginGroupView : UIView

//账号输入框
@property(nonatomic,strong) UITextField *userNameField;
//密码输入框
@property(nonatomic,strong) UITextField *userPawdField;
@property(nonatomic,strong) UIButton *eyeBtn;
//忘记密码按钮
@property(nonatomic,strong) UIButton *forgetPawdBtn;
//登录按钮
@property(nonatomic,strong) UIView *loginLineView;
@property(nonatomic,strong) UIButton *loginBtn;
//注册按钮
@property(nonatomic,strong) UIButton *registerBtn;

@property(nonatomic,copy) void (^ForgetClickBlock)(NSString *phone);
@property(nonatomic,copy) void (^LoginClickBlock)();
@property(nonatomic,copy) void (^RegisterClickBlock)();

@end
