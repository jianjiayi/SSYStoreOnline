//
//  mineHeadView.h
//  SSY
//
//  Created by 大为科技 on 2018/8/1.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mineHeadView : UICollectionReusableView

@property(nonatomic,strong) UIImageView *headerBgImageView;

//头像
@property(nonatomic,strong) UIImageView *headImageView;
//登录按钮
@property(nonatomic,strong) UIButton *switchBtn;
//简介
@property(nonatomic,strong) UIView *abstractView;
//logo
@property(nonatomic,strong) UIImageView *logoView;
//文字
@property(nonatomic,strong) UILabel *textLabel;

//登录事件
@property(nonatomic,copy) dispatch_block_t loginClickBlock;
//修改头像事件
@property(nonatomic,copy) dispatch_block_t headChangeClickBlock;

@end
