//
//  gridItemViewCell.h
//  SSY
//
//  Created by 大为科技 on 2018/7/27.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SSYGridItemModel.h"

@interface gridItemViewCell : UICollectionViewCell

//图片
@property(nonatomic,strong) UIImageView *gridImageView;
//文字
@property(nonatomic,strong) UILabel *gridLabel;
//tag
@property(nonatomic,strong) UILabel *tagLabel;
//数据模型
@property(nonatomic,strong) SSYGridItemModel *GridItemModel;
//点击事件
@property(nonatomic,strong) void(^GridItemClickBlock)(NSString *gridID);


@end
