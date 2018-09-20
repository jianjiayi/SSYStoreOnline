//
//  FormTableViewCell.h
//  SSY
//
//  Created by 大为科技 on 2018/9/3.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FormTableModel.h"

@interface FormTableViewCell : UITableViewCell

@property(nonatomic,strong) UILabel *title;

@property(nonatomic,strong) UIImageView *arrowImageView;

@property(nonatomic,weak) FormTableModel *CreateTableModel;

@end
