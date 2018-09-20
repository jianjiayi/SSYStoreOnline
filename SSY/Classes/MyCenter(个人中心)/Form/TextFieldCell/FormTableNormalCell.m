//
//  FormTableNormalCell.m
//  SSY
//
//  Created by 大为科技 on 2018/9/3.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "FormTableNormalCell.h"

@implementation FormTableNormalCell

#pragma mark - init;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self setUpUI];
    }
    return self;
}

#pragma mark - UI;
-(void)setUpUI{
    _textField = [[UITextField alloc] init];
    _textField.font = PFR13Font;
    _textField.textColor = RGB(16, 0, 0);
    [self addSubview:_textField];
    //接收消息通知方法
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldValueChanged:) name:UITextFieldTextDidChangeNotification object:self.textField];
}


#pragma mark 布局
-(void) layoutSubviews{
    [super layoutSubviews];
    
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.centerY.mas_equalTo(self);
        make.height.mas_equalTo(self.mas_height);
        make.width.mas_equalTo(ScreenW-30);
    }];
}

#pragma mark - 消息代理
-(void)textFieldAddObserver:(id)observer selector:(SEL)selector
{
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:selector name:UITextFieldTextDidChangeNotification object:self.textField];
}

-(void)setCreateTableModel:(FormTableModel *)CreateTableModel
{
    _CreateTableModel = CreateTableModel;
    self.textField.placeholder = CreateTableModel.placeholder;
    self.textField.text = CreateTableModel.textVal;
}

-(void)setFormDic:(NSDictionary *)formDic
{
    _formDic = formDic;
    self.textField.text = [formDic valueForKey:self.CreateTableModel.key];
}

//经输入的内容实施保存到formDic
-(void)textFieldValueChanged:(NSNotification *)note{
    if(!self.CreateTableModel){
        return;
    }
    [self.formDic setValue:self.textField.text forKey:self.CreateTableModel.key];
}





//移除通知
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
