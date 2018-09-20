//
//  SSYSearchResultHeadView.h
//  SSY
//
//  Created by 大为科技 on 2018/9/11.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSYSearchResultHeadView : UIView

//综合
@property(nonatomic,strong) UIButton *comprehensiveBtn;
//销量
@property(nonatomic,strong) UIButton *salesVolumeBtn;
//价格
@property(nonatomic,strong) UIButton *priceBtn;
//排列
@property(nonatomic,strong) UIButton *gridBtn;
//线
@property(nonatomic,strong) UIView *bottomLineView;

//排序判断
@property(nonatomic,assign) BOOL isGrid;

@property(nonatomic,copy) void (^ComprehensiveClickBlock)();

@property(nonatomic,copy) void (^SalesVolumeClickBlock)();

@property(nonatomic,copy) void (^PriceUpDownClickBlock)(BOOL isSelect);

@property(nonatomic,copy) void (^GridClickBlock)(BOOL isSelect);

@end
