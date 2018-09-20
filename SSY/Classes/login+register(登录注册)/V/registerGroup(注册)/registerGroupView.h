//
//  registerGroupView.h
//  SSY
//
//  Created by 大为科技 on 2018/8/21.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface registerGroupView : UIView <UITextFieldDelegate>

//手机号
@property(nonatomic,strong) UITextField *userPhone;
//验证码
@property(nonatomic,strong) UITextField *codeNum;
//验证密码
@property(nonatomic,strong) UITextField *userPawd;
//获取验证码按钮
@property(nonatomic,strong) UIButton *getCodeBtn;
//确认密码
@property(nonatomic,strong) UITextField *truePawd;
//注册View
@property(nonatomic,strong) UIView *buttonView;
//注册button
@property(nonatomic,strong) UIButton *registerBtn;
//登录
@property(nonatomic,strong) UIButton *loginBtn;



/**-----------代理事件-------------------**/
//获取验证码
@property(nonatomic,copy) void (^GetCodeClickBlock)(NSString *phone);
//注册
@property(nonatomic,copy) void (^RegisterClickBlock)();
//登录
@property(nonatomic,copy) void (^LoginClickBlock)();


@end
