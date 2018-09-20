//
//  FormTableSelectCell.h
//  SSY
//
//  Created by 大为科技 on 2018/9/3.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "FormTableViewCell.h"

#import "FormTableModel.h"

@interface FormTableSelectCell : UITableViewCell

@property(nonatomic,strong) UILabel *title;

@property(nonatomic,strong) UILabel *contentLabel;

@property(nonatomic,strong) UILabel *selectLabel;

@property(nonatomic,strong) UIImageView *arrowImageView;

@property(nonatomic,weak) FormTableModel *CreateTableModel;

@property(nonatomic,weak) NSDictionary *formDic;

-(void)textFieldAddObserver:(id)observer selector:(SEL)selector;

@end
