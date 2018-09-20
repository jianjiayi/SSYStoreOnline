//
//  shopCartItemViewCell.h
//  SSY
//
//  Created by 大为科技 on 2018/8/15.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "shopCartGoodsModel.h"

@interface shopCartItemViewCell : UITableViewCell

//商品按钮button
@property(nonatomic,strong) UIButton *clickBtn;
//商品图片imageView
@property(nonatomic,strong) UIImageView *goodsImageView;
//标题label
@property(nonatomic,strong) UILabel *goodsNameLabel;
//规格label
@property(nonatomic,strong) UILabel *goodsSpecLabel;
//单价label
@property(nonatomic,strong) UILabel *goodsPriceLabel;
//减号按钮button
@property(nonatomic,strong) UIButton *cutBtn;
//数量label
@property(nonatomic,strong) UILabel *numberLabel;
//加号button
@property(nonatomic,strong) UIButton *addBtn;

//商品选中事件
@property(nonatomic,copy) void(^ClickRowBlock)(BOOL isClick);

//加法
@property(nonatomic,copy) void (^AddBlock)(UILabel *numberLabel);
//减法
@property(nonatomic,copy) void (^CutBlock)(UILabel *numberLabel);

@property(nonatomic,strong) shopCartGoodsModel *goodsModel;

@end
