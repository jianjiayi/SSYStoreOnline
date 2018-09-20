//
//  forgetPawdView.h
//  SSY
//
//  Created by 大为科技 on 2018/8/23.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface forgetPawdView : UIView <UITextFieldDelegate>

//location
@property(nonatomic,strong) UILabel *locationLabel;
//框
@property(nonatomic,strong) UIView *groupView;
//line线
@property(nonatomic,strong) UIView *bottomLineView;
//提示label
@property(nonatomic,strong) UIView *leftView;
//手机号
@property(nonatomic,strong) UITextField *phoneTextField;
//验证码输入框
@property(nonatomic,strong) UITextField *codeTextField;
//验证码按钮
@property(nonatomic,strong) UIButton *getCodeBtn;
//下一步按钮
@property(nonatomic,strong) UIButton *nextBtn;


/*--------------------block代理----------------------------*/
@property(nonatomic,copy) void (^GetCodeCLickBlock)(NSString *phone);

@property(nonatomic,copy) void (^NextClickBlock)();

@end
