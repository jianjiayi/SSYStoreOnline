//
//  FormTableTVCell.m
//  SSY
//
//  Created by 大为科技 on 2018/9/3.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "FormTableTVCell.h"

@implementation FormTableTVCell

#pragma mark - init;
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
    _textView = [[UITextView alloc] init];
    _textView.font = PFR13Font;
    _textView.textColor = RGB(16, 0, 0);
    [_textView setEditable:YES];
    _textView.scrollEnabled = YES;
    _textView.alpha = 1.0;
    _textView.delegate = self;
    _textView.dataDetectorTypes = UIDataDetectorTypeAll;
    _textView.keyboardType = UIKeyboardTypeDefault;
    _textView.returnKeyType = UIReturnKeySearch;
    [self addSubview:_textView];
    
    _placeholderLabel = [[UILabel alloc] init];
    _placeholderLabel.font = PFR13Font;
    _placeholderLabel.textColor = RGB(200, 200, 200);
    [_textView addSubview:_placeholderLabel];
    
    //添加代理方法
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewDidChange:) name:UITextViewTextDidChangeNotification object:self.textView];

}

#pragma mark - 布局
-(void)layoutSubviews{
    [super layoutSubviews];
    
    [_placeholderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(3);
    }];
    
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(5);
        make.centerX.mas_equalTo(self);
        make.width.mas_equalTo(ScreenW-24);
        [make.bottom.mas_equalTo(self.mas_bottom)setOffset:-5];
    }];
}

#pragma mark - 消息代理
-(void)textFieldAddObserver:(id)observer selector:(SEL)selector{
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:selector name:UITextViewTextDidChangeNotification object:self.textView];
}

#pragma mark - 设置数据
-(void)setCreateTableModel:(FormTableModel *)CreateTableModel
{
    _CreateTableModel = CreateTableModel;
    _placeholderLabel.text = CreateTableModel.placeholder;
}
-(void)setFormDic:(NSDictionary *)formDic
{
    _formDic = formDic;
    self.textView.text = [formDic valueForKey:self.CreateTableModel.key];
}

//
-(void)textViewDidChange:(NSNotification *)note{
    if(!self.CreateTableModel){
        return;
    };
    if(self.textView.text.length!=0){
        self.placeholderLabel.text = @"";
    }else{
        self.placeholderLabel.text = self.CreateTableModel.placeholder;
    }
    [self.formDic setValue:self.textView.text forKey:self.CreateTableModel.key];
}

#pragma mark - 销毁通知
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
