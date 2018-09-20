//
//  homeNavgationBarView.h
//  SSY
//
//  Created by 大为科技 on 2018/8/2.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface homeNavgationBarView : UINavigationBar

/*UI布局*/
//左边按钮
@property(nonatomic,strong) UIButton *leftItemButton;
//搜索框
@property(nonatomic,strong) UIView *topSearchView;
@property(nonatomic,strong) UIButton *searchButton;
//右边按钮
@property(nonatomic,strong) UIButton *rightItemButton;

//通知数
@property(nonatomic,weak) id dcObserve;


/*点击事件*/
//左边按钮点击
@property(nonatomic,copy) dispatch_block_t leftItemClickBlock;
//右边按钮点击
@property(nonatomic,copy) dispatch_block_t rightItemClickBlock;
//搜索按钮点击
@property(nonatomic,copy) dispatch_block_t searchButtonClickBlock;
@end
