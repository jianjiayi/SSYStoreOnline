//
//  shopCartTopToolView.h
//  SSY
//
//  Created by 大为科技 on 2018/8/15.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface shopCartTopToolView : UIView

//title
@property(nonatomic,strong) UILabel *titlelabel;
//右侧按钮1
@property(nonatomic,strong) UIButton *messageBtn;
//右侧按钮2
@property(nonatomic,strong) UIButton *editBtn;

//编辑
@property(nonatomic,copy) void (^EditClickBlock)(BOOL isClick);
//消息
@property(nonatomic,copy) void (^MessageClickBlock)();

@end
