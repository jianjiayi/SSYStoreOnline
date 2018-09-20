//
//  SSYProductListItemCell.h
//  SSY
//
//  Created by 大为科技 on 2018/9/19.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SSYProductListItemModel.h"

@interface SSYProductListItemCell : UICollectionViewCell

//商品图片
@property(nonatomic,strong)UIImageView *goodsImageView;
//商品标题
@property(nonatomic,strong)UILabel *goodsLabel;
//商品价格
@property(nonatomic,strong)UILabel *priceLabel;
//更多按钮
@property(nonatomic,strong)UIButton *moreBtn;

//透明层
@property(nonatomic,strong) UIView *blackView;
//按钮组
@property(nonatomic,strong) UIView *btnGroup;
//看相似
@property(nonatomic,strong) UIButton *similarBtn;
//收藏
@property(nonatomic,strong) UIButton *collectBtn;

//数据模型
@property(nonatomic,strong) SSYProductListItemModel *listItemModel;


@end
