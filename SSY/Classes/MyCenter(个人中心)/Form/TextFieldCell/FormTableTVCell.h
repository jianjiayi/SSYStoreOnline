//
//  FormTableTVCell.h
//  SSY
//
//  Created by 大为科技 on 2018/9/3.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FormTableModel.h"

@interface FormTableTVCell : UITableViewCell<UITextViewDelegate>

//提示文字
@property(nonatomic,strong) UILabel *placeholderLabel;
//输入框
@property(nonatomic,strong) UITextView *textView;

//设置数据模型
@property(nonatomic,weak) FormTableModel *CreateTableModel;
//保存数据
@property(nonatomic,weak) NSDictionary *formDic;

//方便外部调用
-(void)textFieldAddObserver:(id)observer selector:(SEL)selector;
@end
