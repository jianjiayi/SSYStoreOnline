//
//  FormTableCodeCell.h
//  SSY
//
//  Created by 大为科技 on 2018/9/4.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "FormTableViewCell.h"

#import "FormTableModel.h"

@interface FormTableCodeCell : FormTableViewCell

@property(nonatomic,strong) UITextField *codeTextField;

@property(nonatomic,strong) UIButton *getCodeBtn;

@property(nonatomic,copy) void(^ GetCodeClickBlock)();

@property(nonatomic,assign) FormTableModel *creatTableModel;

@property(nonatomic,assign) NSDictionary *formDict;

//方便外部把控输入框
- (void)textFieldAddObserver:(id)observer selector:(SEL)selector;

@end
