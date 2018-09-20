//
//  FormTableSwitchCell.m
//  SSY
//
//  Created by 大为科技 on 2018/9/3.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "FormTableSwitchCell.h"

@implementation FormTableSwitchCell

#pragma mark - init
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self setUpUI];
    }
    return self;
}

#pragma mark -UI
-(void)setUpUI{
    _title = [[UILabel alloc] init];
    _title.font = PFR13Font;
    _title.textColor = RGB(16, 0, 0);
    [self addSubview:_title];
    
    _switchBtn = [[UISwitch alloc] init];
    [_switchBtn setOn:NO animated:YES];
    _switchBtn.onTintColor = MColor;//开关开启的颜色
    
    [_switchBtn addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:_switchBtn];
    
    //添加消息通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setSwitchState:) name:@"FormSwitchBtnForm" object:nil];
}

#pragma mark -布局
-(void)layoutSubviews{
    [super layoutSubviews];
    
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.left.mas_equalTo(15);
    }];
     
    [_switchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.right.mas_equalTo(self.mas_right)setOffset:-15];
        make.centerY.mas_equalTo(self);
    }];
}

-(void)switchAction:(UISwitch *)sender{
    if(self.switchBtn){
        self.SwitchClickBlock(self.switchBtn.isOn);
    }
}


#pragma mark -设置数据
-(void)setCreateTableModel:(FormTableModel *)CreateTableModel
{
    _CreateTableModel = CreateTableModel;
    self.title.text = CreateTableModel.title;
    [self.switchBtn setOn:CreateTableModel.switchState animated:YES];
}

-(void)setFormDic:(NSDictionary *)formDic
{
    _formDic = formDic;
    NSString *text = [NSString stringWithFormat:@"%d",self.switchBtn.isOn];
    [self.formDic setValue:text forKey:self.CreateTableModel.key];
}


#pragma mark -保存数据

-(void)setSwitchState:(NSNotification *) note{
    if(!self.CreateTableModel){
        return;
    }
    NSString *text = [NSString stringWithFormat:@"%d",self.switchBtn.isOn];
    NSLog(@"%@",text);
    [self.formDic setValue:text forKey:self.CreateTableModel.key];
}

//小会通知
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
