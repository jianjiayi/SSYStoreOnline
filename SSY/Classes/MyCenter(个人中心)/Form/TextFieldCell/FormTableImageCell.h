//
//  FormTableImageCell.h
//  SSY
//
//  Created by 大为科技 on 2018/9/4.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "FormTableViewCell.h"

#import "FormTableModel.h"

@interface FormTableImageCell : UITableViewCell

@property(nonatomic,strong) UILabel *title;

@property(nonatomic,strong) UIImageView *arrowImageView;

@property(nonatomic,strong) UIImageView *imgView;

@property(nonatomic,weak) FormTableModel *CreateTableModel;


@end
