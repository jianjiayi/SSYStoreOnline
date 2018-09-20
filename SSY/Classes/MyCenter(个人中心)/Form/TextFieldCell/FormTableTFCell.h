//
//  FormTableTFCell.h
//  SSY
//
//  Created by 大为科技 on 2018/9/4.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "FormTableViewCell.h"

#import "FormTableModel.h"

@interface FormTableTFCell : FormTableViewCell

//label
@property(nonatomic,strong) UILabel *titleLabel;
//textfield
@property(nonatomic,strong) UITextField *textField;

@property(nonatomic,weak) FormTableModel *creatTableModel;
@property(nonatomic,weak) NSDictionary *formDict;

//方便外部把控输入框
-(void)textFieldAddObserver:(id)observer selector:(SEL)selector;

@end
