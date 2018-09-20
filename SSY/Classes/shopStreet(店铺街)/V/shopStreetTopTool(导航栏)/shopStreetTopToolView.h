//
//  shopStreetTopToolView.h
//  SSY
//
//  Created by 大为科技 on 2018/8/9.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface shopStreetTopToolView : UIView

//控制地区选择状态
@property(nonatomic,assign) BOOL flag;

//右边消息按钮
@property(nonatomic,strong) UIButton *rightItemBtn;
//地区选择按钮
@property(nonatomic,strong) UIButton *areaItemBtn;

//地区选择事件
@property(nonatomic,copy) dispatch_block_t  areaItemClickBlock;

//右边按钮点击
@property(nonatomic,copy) dispatch_block_t rightItemClickBlock;

@end
