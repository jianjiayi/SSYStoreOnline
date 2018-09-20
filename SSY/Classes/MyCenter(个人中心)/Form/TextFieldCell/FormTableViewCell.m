//
//  FormTableViewCell.m
//  SSY
//
//  Created by 大为科技 on 2018/9/3.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "FormTableViewCell.h"

@implementation FormTableViewCell

#pragma mark - init
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self setUpUI];
    }
    return self;
}

#pragma mark - UI
-(void)setUpUI
{
    _title = [[UILabel alloc] init];
    _title.font = PFR13Font;
    _title.textColor = RGB(16, 0, 0);
    [self addSubview:_title];
    
    _arrowImageView = [[UIImageView alloc] init];
    _arrowImageView.contentMode = UIViewContentModeScaleAspectFit;
    _arrowImageView.clipsToBounds = YES;
    _arrowImageView.image = [UIImage imageNamed:@"ArrowRight_icon"];
    [self addSubview:_arrowImageView];
}

#pragma mark - 布局
-(void)layoutSubviews{
    [super layoutSubviews];
    
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.left.mas_equalTo(self.mas_left)setOffset:15];
        make.height.mas_equalTo(40);
        make.centerY.mas_equalTo(self);
    }];
    
    [_arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.right.mas_equalTo(self.mas_right)setOffset:-10];
        make.size.mas_equalTo(CGSizeMake(8, 10));
        make.centerY.mas_equalTo(self);
    }];
}

-(void)setCreateTableModel:(FormTableModel *)CreateTableModel
{
    _CreateTableModel = CreateTableModel;
    self.title.text = CreateTableModel.title;
}

@end
