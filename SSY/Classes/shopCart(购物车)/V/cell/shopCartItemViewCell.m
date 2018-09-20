//
//  shopCartItemViewCell.m
//  SSY
//
//  Created by 大为科技 on 2018/8/15.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "shopCartItemViewCell.h"

@implementation shopCartItemViewCell

#pragma mark -Init
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self setUpUI];
    }
    return self;
}

#pragma mark - UI
-(void)setUpUI{
    //选择按钮
    _clickBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_clickBtn setImage:[UIImage imageNamed:@"unClick_icon"] forState:UIControlStateNormal];
    [_clickBtn setImageEdgeInsets:UIEdgeInsetsMake(11, 6, 11, 6)];
    [_clickBtn addTarget:self action:@selector(goodsClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_clickBtn];
    //商品图片
    _goodsImageView = [[UIImageView alloc] init];
    _goodsImageView.contentMode = UIViewContentModeScaleAspectFill;
    _goodsImageView.clipsToBounds = YES;
    [self addSubview:_goodsImageView];
    //标题
    _goodsNameLabel = [[UILabel alloc] init];
    _goodsNameLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    _goodsNameLabel.textColor = [UIColor colorWithRed:16/255.0 green:0/255.0 blue:0/255.0 alpha:1/1.0];
    _goodsNameLabel.numberOfLines = 2;
    [self addSubview:_goodsNameLabel];
    //规格
    _goodsSpecLabel = [[UILabel alloc] init];
    _goodsSpecLabel.font = [UIFont fontWithName:@"Helvetica" size:11];
    _goodsSpecLabel.textColor = [UIColor colorWithRed:155/255.0 green:155/255.0 blue:155/255.0 alpha:1/1.0];
    [self addSubview:_goodsSpecLabel];
    //单价
    _goodsPriceLabel = [[UILabel alloc] init];
    _goodsPriceLabel.font= [UIFont fontWithName:@"Helvetica" size:14];
    _goodsPriceLabel.textColor = [UIColor colorWithRed:255/255.0 green:123/255.0 blue:59/255.0 alpha:1/1.0];
    [self addSubview:_goodsPriceLabel];
    //减号按钮
    _cutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_cutBtn setTitle:@"-" forState:UIControlStateNormal];
    [_cutBtn setTitleColor:[UIColor colorWithRed:16/255.0 green:0/255.0 blue:0/255.0 alpha:1/1.0] forState:UIControlStateNormal];
    [_cutBtn addTarget:self action:@selector(cutClickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_cutBtn];
    //数量
    _numberLabel = [[UILabel alloc] init];
    _numberLabel.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1/1.0];
    _numberLabel.font = [UIFont fontWithName:@"Helvetica" size:12];
    _numberLabel.textColor = [UIColor colorWithRed:16/255.0 green:0/255.0 blue:0/255.0 alpha:1/1.0];
    _numberLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_numberLabel];
    //加号按钮
    _addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_addBtn setTitle:@"+" forState:UIControlStateNormal];
    [_addBtn setTitleColor:[UIColor colorWithRed:16/255.0 green:0/255.0 blue:0/255.0 alpha:1/1.0] forState:UIControlStateNormal];
    [_addBtn addTarget:self action:@selector(addClickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_addBtn];
    
}

#pragma mark - 布局
-(void) layoutSubviews{
    [super layoutSubviews];
    
    [_clickBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.left.mas_equalTo(5);
        make.size.mas_equalTo(CGSizeMake(30, 40));
    }];
    
    [_goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.left.mas_equalTo(self.clickBtn.mas_right)setOffset:10];
        make.centerY.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    
    [_goodsNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.left.mas_equalTo(self.goodsImageView.mas_right)setOffset:10];
        [make.right.mas_equalTo(self.mas_right)setOffset:-3];
        [make.top.mas_equalTo(self.goodsImageView.mas_top)setOffset:0];
    }];
    
    [_goodsSpecLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.top.mas_equalTo(self.goodsNameLabel.mas_bottom)setOffset:10];
        [make.left.mas_equalTo(self.goodsImageView.mas_right)setOffset:10];
    }];
    
    [_goodsPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.left.mas_equalTo(self.goodsImageView.mas_right)setOffset:8];
        [make.bottom.mas_equalTo(self.goodsImageView.mas_bottom)setOffset:0];
    }];
    
    [_addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.right.mas_equalTo(self.mas_right)setOffset:-10];
        [make.bottom.mas_equalTo(self.goodsImageView.mas_bottom)setOffset:0];
        make.size.mas_equalTo(CGSizeMake(30, 20));
    }];
    
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.right.mas_equalTo(self.addBtn.mas_left)setOffset:0];
        make.centerY.mas_equalTo(self.addBtn);
        make.size.mas_equalTo(CGSizeMake(30, 20));
    }];
    
    [_cutBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.right.mas_equalTo(self.numberLabel.mas_left)setOffset:0];
        make.centerY.mas_equalTo(self.addBtn);
        make.size.mas_equalTo(CGSizeMake(30, 20));
    }];
    
}

//选择按钮点击
-(void)goodsClick:(UIButton *)sender{
    sender.selected = !sender.selected;
    if(sender.selected){
        [sender setImage:[UIImage imageNamed:@"clicked_icon"] forState:UIControlStateNormal];
        [sender setImageEdgeInsets:UIEdgeInsetsMake(9, 4, 9, 4)];
    }else{
        [sender setImage:[UIImage imageNamed:@"unClick_icon"] forState:UIControlStateNormal];
        [sender setImageEdgeInsets:UIEdgeInsetsMake(11, 6, 11, 6)];
    }
    
    if(self.ClickRowBlock){
        self.ClickRowBlock(sender.selected);
    }
}

//加法事件
-(void)addClickBtn:(UIButton *)sender{
    NSInteger count = [self.numberLabel.text integerValue];
    count++;
    self.numberLabel.text = [NSString stringWithFormat:@"%ld",count];
    
    if(self.addBtn){
        self.AddBlock(self.numberLabel);
    }
}
//减法事件
-(void)cutClickBtn:(UIButton *)sender{
    NSInteger count = [self.numberLabel.text integerValue];
    count--;
    if(count <= 0){
        return;
    }
    
    self.numberLabel.text = [NSString stringWithFormat:@"%ld",count];
    
    if(self.cutBtn){
        self.CutBlock(self.numberLabel);
    }
}


//赋值
-(void)setGoodsModel:(shopCartGoodsModel *)goodsModel{
    _goodsModel = goodsModel;
    //修改按钮状态
    if(goodsModel.isSelect){
        [self.clickBtn setImage:[UIImage imageNamed:@"clicked_icon"] forState:UIControlStateNormal];
        [self.clickBtn setImageEdgeInsets:UIEdgeInsetsMake(9, 4, 9, 4)];
    }else{
        [self.clickBtn setImage:[UIImage imageNamed:@"unClick_icon"] forState:UIControlStateNormal];
        [self.clickBtn setImageEdgeInsets:UIEdgeInsetsMake(11, 6, 11, 6)];
    }
    self.clickBtn.selected = goodsModel.isSelect;
    //商品主图
    self.goodsImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",goodsModel.goodsImage]];
    //商品标题
    self.goodsNameLabel.text = goodsModel.goodsName;
    //商品规格
    self.goodsSpecLabel.text = goodsModel.goodsSpec;
    //商品单价
    self.goodsPriceLabel.text = goodsModel.goodsPrice;
    //购买数量
    self.numberLabel.text = [NSString stringWithFormat:@"%@",goodsModel.count];
    
}
@end
