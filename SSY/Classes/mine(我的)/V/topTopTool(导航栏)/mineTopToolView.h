//
//  mineTopToolView.h
//  SSY
//
//  Created by 大为科技 on 2018/8/1.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mineTopToolView : UIView

//设置按钮
@property(nonatomic,strong) UIButton *settingItemButton;
//消息按钮
@property(nonatomic,strong) UIButton *messageItemButton;

//设置按钮点击
@property(nonatomic,copy) void(^ SettingClickBlock)();
//消息按钮点击
@property(nonatomic,copy) void(^ MessageClickBlock)();

@end
