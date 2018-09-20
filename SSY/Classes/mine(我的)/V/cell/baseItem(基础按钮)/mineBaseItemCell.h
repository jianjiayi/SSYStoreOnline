//
//  mineBaseItemCell.h
//  SSY
//
//  Created by 大为科技 on 2018/8/7.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SSYMineBaseItemModel.h"

@interface mineBaseItemCell : UICollectionViewCell

@property(nonatomic,strong) UIImageView *iconImageView;

@property(nonatomic,strong) UILabel *textLabel;

@property(nonatomic,strong) SSYMineBaseItemModel *baseItemModel;

@end
