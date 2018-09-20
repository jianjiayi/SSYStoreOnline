//
//  Header.h
//  SSY
//
//  Created by 大为科技 on 2018/8/3.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#ifndef Header_h
#define Header_h

// 屏幕高度
#define ScreenH [UIScreen mainScreen].bounds.size.height

// 屏幕宽度
#define ScreenW [UIScreen mainScreen].bounds.size.width

//弱引用
#define WEAKSELF __weak typeof(self) weakSelf = self;

//状态栏高度
#define StatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height

//导航栏高度
#define NavBarHeight 44.0

//底部tabbar高度
#define TabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)

//整个导航栏高度
#define TopHeight (StatusBarHeight + NavBarHeight)

//判断是否为iphoneX
#define isPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)


//主色值
#define MColor [UIColor colorWithRed:72/255.0 green:188/255.0 blue:119/255.0 alpha:1/1.0]//绿色
#define MColor4 [UIColor colorWithRed:72/255.0 green:188/255.0 blue:119/255.0 alpha:0.4]//绿色

//其他色值
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]//可以透明
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1/1.0]//不透明

//字体
#define PFR [[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0 ? @"PingFangSC-Regular" : @"PingFang SC"
#define PFR20Font [UIFont fontWithName:PFR size:20];
#define PFR18Font [UIFont fontWithName:PFR size:18];
#define PFR16Font [UIFont fontWithName:PFR size:16];
#define PFR15Font [UIFont fontWithName:PFR size:15];
#define PFR14Font [UIFont fontWithName:PFR size:14];
#define PFR13Font [UIFont fontWithName:PFR size:13];
#define PFR12Font [UIFont fontWithName:PFR size:12];
#define PFR11Font [UIFont fontWithName:PFR size:11];
#define PFR10Font [UIFont fontWithName:PFR size:10];
#define PFR9Font [UIFont fontWithName:PFR size:9];
#define PFR8Font [UIFont fontWithName:PFR size:8];


#endif /* Header_h */
