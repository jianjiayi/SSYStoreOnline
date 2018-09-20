//
//  SSYScrollMenu.h
//  SSY
//
//  Created by 大为科技 on 2018/9/19.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <UIKit/UIKit.h>
//设置代理协议
@protocol SSYScrollMenuDelegate <NSObject>

@optional

//方便外部调用方法
- (void) menuBtnClickAtIndex:(NSInteger)index;

@end

@interface SSYScrollMenu : UIView

//定义属性来遵守协议 注意这里修饰词要用weak
@property(nonatomic,weak)id<SSYScrollMenuDelegate> delegate;

//选中的按钮
@property(nonatomic,weak) UIButton *selectedBtn;
//按钮数组
@property(nonatomic,strong) NSMutableArray *menuArray;
//是否显示下线
@property(nonatomic,assign) BOOL *isShowBreakline;



//设置下划线颜色
-(void)setBreaklineColor:(UIColor *)color;
//设置选择按钮
-(void)setSelectedIndex:(NSInteger)index;


@end
