//
//  resetPawdView.h
//  SSY
//
//  Created by 大为科技 on 2018/8/23.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface resetPawdView : UIView <UITextFieldDelegate>

//location
@property(nonatomic,strong) UILabel *locationLabel;
//line线
@property(nonatomic,strong) UIView *bottomLineView;
//新密码
@property(nonatomic,strong) UITextField *pawdTextField;
//确认密码
@property(nonatomic,strong) UITextField *truePAwdTextField;
//提交
@property(nonatomic,strong) UIButton *submitBtn;


//代理
@property(nonatomic,copy) void (^ResetClickBlock)();

@end
