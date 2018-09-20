//
//  SSYClassifyRightCollectionViewCell.h
//  SSY
//
//  Created by 大为科技 on 2018/9/12.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SSYCliassifyRightModel.h"

@interface SSYClassifyRightCollectionViewCell : UICollectionViewCell

//图片
@property(nonatomic,strong) UIImageView *imageView;
//文字
@property(nonatomic,strong) UILabel *titleLabel;

@property(nonatomic,strong) SSYCliassifyRightModel *curNoHeadRightModel;


@end
