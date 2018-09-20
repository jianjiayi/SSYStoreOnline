//
//  FormTableSwitchCell.h
//  SSY
//
//  Created by 大为科技 on 2018/9/3.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FormTableModel.h"

@interface FormTableSwitchCell : UITableViewCell

@property(nonatomic,strong) UILabel *title;

@property(nonatomic,strong) UISwitch *switchBtn;

@property(nonatomic,weak) FormTableModel *CreateTableModel;

@property(nonatomic,weak) NSDictionary *formDic;

@property(nonatomic,copy) void (^SwitchClickBlock)(BOOL isSelect);

//方便外部调用
-(void)switchAddObserver:(id)observer selector:(SEL)selector;

@end
