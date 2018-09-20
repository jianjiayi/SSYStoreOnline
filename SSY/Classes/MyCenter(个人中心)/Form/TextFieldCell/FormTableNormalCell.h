//
//  FormTableNormalCell.h
//  SSY
//
//  Created by 大为科技 on 2018/9/3.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FormTableModel.h"

@interface FormTableNormalCell : UITableViewCell

//输入框
@property(nonatomic,strong) UITextField *textField;

//创建模型
@property(nonatomic,weak) FormTableModel *CreateTableModel;
//保存字典
@property(nonatomic,weak) NSDictionary *formDic;

//方便外部调用
-(void)textFieldAddObserver:(id)observer selector:(SEL)selector;

@end
