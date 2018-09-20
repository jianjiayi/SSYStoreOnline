//
//  shopCartHeaderView.h
//  SSY
//
//  Created by 大为科技 on 2018/8/15.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "shopCartStoreModel.h"

@interface shopCartHeaderView : UITableViewHeaderFooterView

//商家按钮
@property(nonatomic,strong) UIButton *clickBtn;
//商家图标
@property(nonatomic,strong) UIImageView *shopImageView;
//商家名称
@property(nonatomic,strong) UIButton *shopNameBtn;

//选择商家
@property(nonatomic,copy) void (^shopClickBlock)(BOOL isClick);

//声明变量
@property(nonatomic,assign) BOOL isClick;


//
@property(nonatomic,strong) shopCartStoreModel *storeModel;


@end
