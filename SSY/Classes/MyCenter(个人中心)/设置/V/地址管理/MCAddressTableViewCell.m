//
//  MCAddressTableViewCell.m
//  SSY
//
//  Created by 大为科技 on 2018/9/5.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "MCAddressTableViewCell.h"

@implementation MCAddressTableViewCell

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
    _nameLabel = [[UILabel alloc] init];
    _nameLabel.text = @"菅双鹏";
    _nameLabel.font = PFR13Font;
    _nameLabel.textColor = RGB(16, 0, 0);
    [self addSubview:_nameLabel];
    
    _phoneLabel = [[UILabel alloc] init];
    _phoneLabel.font = PFR13Font;
    _phoneLabel.text = @"13121378101";
    _phoneLabel.textColor = RGB(16, 0, 0);
    [self addSubview:_phoneLabel];
    
    _addressLabel = [[UILabel alloc] init];
    _addressLabel.text = @"河北省廊坊市固安县牛驼镇140号";
    _addressLabel.font = PFR12Font;
    _addressLabel.textColor = RGB(115, 115, 115);
    [self addSubview:_addressLabel];
    
    _bottonLineView = [[UIView alloc] init];
    _bottonLineView.backgroundColor = RGB(244, 244, 244);
    [self addSubview:_bottonLineView];
    
    //选择按钮
    _clickBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_clickBtn setImage:[UIImage imageNamed:@"unClick_icon"] forState:UIControlStateNormal];
    //    [_clickBtn setImage:[UIImage imageNamed:@"clicked_icon"] forState:UIControlStateSelected];
    [_clickBtn setImageEdgeInsets:UIEdgeInsetsMake(6, 0, 6, 12)];
    [_clickBtn addTarget:self action:@selector(addressClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_clickBtn];
    
    _clickLabel = [[UILabel alloc] init];
    _clickLabel.text = @"默认地址";
    _clickLabel.font = PFR12Font;
    _clickLabel.textColor = RGB(115, 115, 115);
    [self addSubview:_clickLabel];
    
    
    _editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_editBtn setTitle:@"编辑" forState:UIControlStateNormal];
    [_editBtn setTitleColor:RGB(115, 115, 115) forState:UIControlStateNormal];
    _editBtn.titleLabel.font = PFR12Font;
    [_editBtn setImage:[UIImage imageNamed:@"edit_icon"] forState:UIControlStateNormal];
    [_editBtn setImageEdgeInsets:UIEdgeInsetsMake(5, 5, 5, _editBtn.titleLabel.intrinsicContentSize.width+5)];
    [_editBtn addTarget:self action:@selector(editBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_editBtn];
    
    _delBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_delBtn setTitle:@"删除" forState:UIControlStateNormal];
    [_delBtn setTitleColor:RGB(115, 115, 115) forState:UIControlStateNormal];
    _delBtn.titleLabel.font = PFR12Font;
    [_delBtn setImage:[UIImage imageNamed:@"del_icon"] forState:UIControlStateNormal];
    [_delBtn setImageEdgeInsets:UIEdgeInsetsMake(6, 5, 6, _delBtn.titleLabel.intrinsicContentSize.width+5)];
    //    [_delBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 40, 0, 0)];
    [_delBtn addTarget:self action:@selector(delBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_delBtn];}

#pragma mark - 布局
-(void)layoutSubviews{
    [super layoutSubviews];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.height.mas_equalTo(20);
        make.top.mas_equalTo(10);
    }];
    
    [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.left.mas_equalTo(self.nameLabel.mas_right)setOffset:5];
        make.centerY.mas_equalTo(self.nameLabel);
    }];
    
    [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.top.mas_equalTo(self.nameLabel.mas_bottom)setOffset:5];
        make.left.mas_equalTo(15);
        make.width.mas_equalTo(ScreenW-30);
    }];
    
    [_bottonLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.top.mas_equalTo(self.addressLabel.mas_bottom)setOffset:8];
        make.left.mas_equalTo(15);
        make.size.mas_equalTo(CGSizeMake(ScreenW-15, 1));
    }];
    
    [_clickBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        [make.top.mas_equalTo(self.bottonLineView.mas_bottom)setOffset:5];
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [_clickLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.clickBtn);
        [make.left.mas_equalTo(self.clickBtn.mas_right)setOffset:0];
    }];
    
    [_delBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.right.mas_equalTo(self.mas_right)setOffset:-15];
        make.centerY.mas_equalTo(self.clickBtn);
    }];
    
    [_editBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.right.mas_equalTo(self.delBtn.mas_left)setOffset:-10];
        make.centerY.mas_equalTo(self.clickBtn);
    }];
}

-(void)setCreateAddressModel:(createAddressModel *)CreateAddressModel
{
    _CreateAddressModel = CreateAddressModel;
    self.nameLabel.text = CreateAddressModel.name;
    self.phoneLabel.text = CreateAddressModel.phone;
    self.addressLabel.text = CreateAddressModel.address;
    self.clickBtn.selected = CreateAddressModel.isSelect;
    if(CreateAddressModel.isSelect){
        [self.clickBtn setImage:[UIImage imageNamed:@"clicked_icon"] forState:UIControlStateNormal];
        [self.clickBtn setImageEdgeInsets:UIEdgeInsetsMake(4, 0, 4, 8)];
    }else{
        [self.clickBtn setImage:[UIImage imageNamed:@"unClick_icon"] forState:UIControlStateNormal];
        [self.clickBtn setImageEdgeInsets:UIEdgeInsetsMake(6, 0, 6, 12)];
    }
}

//选择按钮点击
-(void)addressClick:(UIButton *)sender{
    if(self.clickBtn){
        self.setDefualtClickBlock(sender.selected);
    }
}

//编辑按钮
-(void)editBtnClick:(UIButton *)sender{
    if(self.editBtn){
        self.editClickBlock();
    }
}

//删除
-(void)delBtnClick:(UIButton *)sender{
    if(self.delBtn){
        self.delClickBlock();
    }
}

@end
