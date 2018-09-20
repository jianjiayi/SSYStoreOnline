//
//  SSYOtherClassifyDaySelectCell.h
//  SSY
//
//  Created by 大为科技 on 2018/9/17.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SSYOtherClassifyDaySelectModel.h"

@interface SSYOtherClassifyDaySelectCell : UICollectionViewCell

//图片
@property(nonatomic,strong) UIImageView *imgView;
//标题
@property(nonatomic,strong) UILabel *titleLabel;
//价格
@property(nonatomic,strong) UILabel *priceLabel;


//数据模型
@property(nonatomic,strong) SSYOtherClassifyDaySelectModel *daySelectModel;


@end
