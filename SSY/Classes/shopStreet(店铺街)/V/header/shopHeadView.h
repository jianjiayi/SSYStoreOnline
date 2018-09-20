//
//  shopHeadView.h
//  SSY
//
//  Created by 大为科技 on 2018/8/8.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface shopHeadView : UICollectionReusableView
//商家头像
@property(nonatomic,strong) UIImageView *shopIconView;
//商家名称
@property(nonatomic,strong) UILabel *shopNameLabel;
//是否关注
@property(nonatomic,strong) UIButton *follwBtn;

//按钮点击事件
@property(nonatomic,copy) dispatch_block_t followButtonClickBlock;

@end
