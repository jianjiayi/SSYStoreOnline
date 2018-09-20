//
//  mineOrderItemCell.h
//  SSY
//
//  Created by 大为科技 on 2018/8/3.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SSYMineOrderItemModel.h"

@interface mineOrderItemCell : UICollectionViewCell

//icon
@property(nonatomic,strong) UIImageView *iconImageView;
//状态label
@property(nonatomic,strong) UILabel *statusLabel;

//创建模型
@property(nonatomic,strong) SSYMineOrderItemModel *orderItemModel;


@end
