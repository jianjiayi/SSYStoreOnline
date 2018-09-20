//
//  FormTableSelectCell.m
//  SSY
//
//  Created by 大为科技 on 2018/9/3.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "FormTableSelectCell.h"

@implementation FormTableSelectCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self setUpUI];
    }
    return self;
}

-(void)setUpUI{
    
    _title = [[UILabel alloc] init];
    _title.font = PFR13Font;
    _title.textColor = RGB(16, 0, 0);
    [self addSubview:_title];
    
    
    _contentLabel = [[UILabel alloc] init];
    _contentLabel.font = PFR13Font;
    _contentLabel.textColor = RGB(16, 0, 0);
    [self addSubview:_contentLabel];
    
    _selectLabel = [[UILabel alloc] init];
    _selectLabel.font = PFR13Font;
    _selectLabel.textColor = RGB(200, 200, 200);
    [self addSubview:_selectLabel];
    
    _arrowImageView = [[UIImageView alloc] init];
    _arrowImageView.contentMode = UIViewContentModeScaleAspectFit;
    _arrowImageView.clipsToBounds = YES;
    _arrowImageView.image = [UIImage imageNamed:@"ArrowRight_icon"];
    [self addSubview:_arrowImageView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setContentLabel:) name:@"FormSetContentText" object:nil];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.left.mas_equalTo(self.mas_left)setOffset:15];
        make.height.mas_equalTo(40);
        make.centerY.mas_equalTo(self);
    }];
    
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.left.mas_equalTo(self.title.mas_right)setOffset:40];
        make.centerY.mas_equalTo(self);
    }];
    
    [_arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.right.mas_equalTo(self.mas_right)setOffset:-10];
        make.size.mas_equalTo(CGSizeMake(8, 10));
        make.centerY.mas_equalTo(self);
    }];
    
    [_selectLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        [make.right.mas_equalTo(self.arrowImageView.mas_left)setOffset:-10];
    }];
}

-(void)textFieldAddObserver:(id)observer selector:(SEL)selector{
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:selector name:@"FormSetContentText" object:self.contentLabel];
}


-(void)setCreateTableModel:(FormTableModel *)CreateTableModel
{
    _CreateTableModel = CreateTableModel;
    self.title.text = CreateTableModel.title;
    self.selectLabel.text = CreateTableModel.placeholder;
}

-(void)setFormDic:(NSDictionary *)formDic
{
    _formDic = formDic;
    self.contentLabel.text = [formDic valueForKey:self.CreateTableModel.key];
}

-(void)setContentLabel:(NSNotification *)note
{
    if(!self.CreateTableModel){
        return;
    }
    NSLog(@"sadfasdfasdf2222");
    NSDictionary *infoDic = [note object];
    self.contentLabel.text = infoDic[@"text"];
    [self.formDic setValue:self.contentLabel.text forKey:self.CreateTableModel.key];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
