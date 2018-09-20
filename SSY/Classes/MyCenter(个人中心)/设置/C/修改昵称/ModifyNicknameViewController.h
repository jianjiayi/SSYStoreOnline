//
//  ModifyNicknameViewController.h
//  SSY
//
//  Created by 大为科技 on 2018/8/29.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ChangeTextBlock) (NSString *text);

@interface ModifyNicknameViewController : UIViewController

@property(nonatomic,strong) UIView *textView;

@property(nonatomic,strong) UITextField *nickNameTextField;

@property(nonatomic,strong) UILabel *tipsLabel;


@end
