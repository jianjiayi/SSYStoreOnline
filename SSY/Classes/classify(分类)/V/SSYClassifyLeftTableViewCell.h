//
//  SSYClassifyLeftTableViewCell.h
//  SSY
//
//  Created by 大为科技 on 2018/9/12.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SSYClassifyLeftModel.h"

@interface SSYClassifyLeftTableViewCell : UITableViewCell

//左侧线
@property(nonatomic,strong) UIView *leftLineView;
//名称
@property(nonatomic,strong) UILabel *classifyNameLabel;

//是否被选中
@property(nonatomic,assign) BOOL hasBeenSelected;


@property(nonatomic,strong) SSYClassifyLeftModel *curLeftTagModel;


@end
