//
//  MCAddressTableViewCell.h
//  SSY
//
//  Created by 大为科技 on 2018/9/5.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "createAddressModel.h"

@interface MCAddressTableViewCell : UITableViewCell

//收件人姓名
@property(nonatomic,strong) UILabel *nameLabel;
//收件人手机号
@property(nonatomic,strong) UILabel *phoneLabel;
//收件人地址
@property(nonatomic,strong) UILabel *addressLabel;
//分割线
@property(nonatomic,strong) UIView *bottonLineView;

//是否默认按钮
@property(nonatomic,strong) UIButton *clickBtn;
//按钮提示文字
@property(nonatomic,strong) UILabel *clickLabel;

//编辑按钮
@property(nonatomic,strong) UIButton *editBtn;
//删除按钮
@property(nonatomic,strong) UIButton *delBtn;

//保存选中按钮
@property(nonatomic,strong) UIButton *selectBtn;

@property(nonatomic,weak) createAddressModel *CreateAddressModel;

//选择默认事件
@property(nonatomic,copy) void(^setDefualtClickBlock)(BOOL isSelect);
//编辑事件
@property(nonatomic,copy) void(^editClickBlock)();
//删除事件
@property(nonatomic,copy) void(^delClickBlock)();


@end
