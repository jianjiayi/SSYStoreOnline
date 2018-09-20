//
//  FormTableTFCell.m
//  SSY
//
//  Created by 大为科技 on 2018/9/4.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "FormTableTFCell.h"

@implementation FormTableTFCell

#pragma mark - init
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self setUpUI];
    }
    return self;
}

#pragma mark - UI
-(void)setUpUI{
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.font = PFR13Font;
    _titleLabel.textColor = RGB(16, 0, 0);
    [self addSubview:_titleLabel];
    
    _textField = [[UITextField alloc] init];
    _textField.font = PFR13Font;
    _textField.textColor = RGB(16, 0, 0);
    [self addSubview:_textField];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldValueChanged:) name:UITextFieldTextDidChangeNotification object:self.textField];
    
}

#pragma mark -布局
-(void)layoutSubviews{
    [super layoutSubviews];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.centerY.mas_equalTo(self);
    }];
    
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.left.mas_equalTo(self.titleLabel.mas_right)setOffset:10];
        make.centerY.mas_equalTo(self);
        make.width.mas_equalTo(ScreenW - 100);
        make.height.mas_equalTo(self.mas_height);
    }];
}

#pragma mark --textField添加通知回调
- (void)textFieldAddObserver:(id)observer selector:(SEL)selector
{
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:selector name:UITextFieldTextDidChangeNotification object:self.textField];
}

-(void)setCreatTableModel:(FormTableModel *)creatTableModel
{
    _creatTableModel = creatTableModel;
    self.titleLabel.text = creatTableModel.title;
    self.textField.placeholder = creatTableModel.placeholder;
    self.textField.text = creatTableModel.textVal;
}

-(void)setFormDict:(NSDictionary *)formDict
{
    _formDict = formDict;
    self.textField.text = [formDict valueForKey:self.creatTableModel.key];
}


//将输入的内容保存到forDict里面
-(void)textFieldValueChanged:(NSNotification *)note{
    if(!self.creatTableModel){
        return;
    }
    [self.formDict setValue:self.textField.text forKey:self.creatTableModel.key];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    
}

@end
