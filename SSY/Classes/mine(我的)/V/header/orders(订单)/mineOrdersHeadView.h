//
//  mineOrdersHeadView.h
//  SSY
//
//  Created by 大为科技 on 2018/8/3.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mineOrdersHeadView : UICollectionReusableView

@property(nonatomic,strong) UILabel *nameLabel;

@property(nonatomic,strong) UIButton *moreBtn;

@property(nonatomic,strong) UIView *lineView;

//查看搜有订单
@property(nonatomic,copy) void(^AllOrderClickBlock)();

@end
