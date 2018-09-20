//
//  SSYSearchResultCollectionViewCell.h
//  SSY
//
//  Created by 大为科技 on 2018/9/11.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSYSearchResultCollectionViewCell : UICollectionViewCell

//主图
@property(nonatomic,strong) UIImageView *imgView;
//标题
@property(nonatomic,strong) UILabel *titileLabel;
//邮费
@property(nonatomic,strong) UILabel *postageLabel;
//单价
@property(nonatomic,strong) UILabel *priceLabel;
//店铺名称
@property(nonatomic,strong) UILabel *shopNameLabel;
//进店按钮
@property(nonatomic,strong) UIButton *shopBtn;
//加入购物车按钮
@property(nonatomic,strong) UIButton *addCartBtn;

@property(nonatomic,strong) UIView *lineView;


//0:列表视图；1：格子视图
@property(nonatomic,assign) BOOL *isGrid;
//数据模型

//查看店铺
@property(nonatomic,copy) void (^GoShopClickBlock)(NSString *shopID);
//加入购物车
@property(nonatomic,copy) void (^AddCartClickBlock)(NSString *proID);
//查看详情
@property(nonatomic,copy) void (^LookDetailClickBlock)(NSString *proID);

@end
