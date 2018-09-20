//
//  hotGoodsItemCell.h
//  SSY
//
//  Created by 大为科技 on 2018/7/27.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface hotGoodsItemCell : UICollectionViewCell

//title
@property(nonatomic,strong) UILabel *titleLabel;

@property(nonatomic,strong) UIView *boxView;

//图片
@property(nonatomic,strong) UIImageView *goodsImageView;
//名称
@property(nonatomic,strong) UILabel *goodsLabel;
//价格
@property(nonatomic,strong) UILabel *priceLabel;


@end
