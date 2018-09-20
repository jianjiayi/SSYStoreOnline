//
//  shopCartBottomView.h
//  SSY
//
//  Created by 大为科技 on 2018/8/15.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface shopCartBottomView : UIView

//全选按钮
@property(nonatomic,strong) UIButton *allClickBtn;
@property(nonatomic,strong) UILabel *allTextLabel;
//合计label
@property(nonatomic,strong) UILabel *allPriceLabel;
//结算按钮
@property(nonatomic,strong) UIButton *clearingBtn;
//关注按钮
@property(nonatomic,strong) UIButton *concernBtn;
//删除按钮
@property(nonatomic,strong) UIButton *deleteBtn;

//是否全选变量
@property(nonatomic,assign) BOOL isClick;
//点击全选按钮事件
@property (nonatomic, copy) void (^AllClickBlock)(BOOL isClick);
@property (nonatomic, copy) void (^AccountBlock)();

@end
