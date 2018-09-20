//
//  SSYSearchResultHeadView.m
//  SSY
//
//  Created by 大为科技 on 2018/9/11.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "SSYSearchResultHeadView.h"

@implementation SSYSearchResultHeadView
{
    long _tag;;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        _tag = 0;
        [self setUpUI];
    }
    return self;
}

-(void)setUpUI{
    _comprehensiveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_comprehensiveBtn setTitle:@"综合" forState:UIControlStateNormal];
    [_comprehensiveBtn setTitleColor:MColor forState:UIControlStateNormal];
    _comprehensiveBtn.titleLabel.font = PFR14Font;
    _comprehensiveBtn.tag = 0;
    [_comprehensiveBtn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_comprehensiveBtn];
    
    _salesVolumeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_salesVolumeBtn setTitle:@"销量" forState:UIControlStateNormal];
    [_salesVolumeBtn setTitleColor:RGB(16, 0, 0) forState:UIControlStateNormal];
    [_salesVolumeBtn setTitleColor:MColor forState:UIControlStateSelected];
    _salesVolumeBtn.titleLabel.font = PFR14Font;
    _salesVolumeBtn.tag = 1;
    [_salesVolumeBtn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_salesVolumeBtn];
    
    
    _priceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_priceBtn setTitle:@"价格" forState:UIControlStateNormal];
    [_priceBtn setTitleColor:RGB(16, 0, 0) forState:UIControlStateNormal];
    [_priceBtn setTitleColor:MColor forState:UIControlStateSelected];
    [_priceBtn setImage:[UIImage imageNamed:@"price_sort_defualt"] forState:UIControlStateNormal];
    [_priceBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -_priceBtn.imageView.intrinsicContentSize.width, 0, _priceBtn.imageView.intrinsicContentSize.width)];
    [_priceBtn setImageEdgeInsets:UIEdgeInsetsMake(3, _priceBtn.titleLabel.intrinsicContentSize.width+3, 3, 2)];
    _priceBtn.titleLabel.font = PFR14Font;
    _priceBtn.tag = 2;
    [_priceBtn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_priceBtn];
    
    _gridBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_gridBtn setImage:[UIImage imageNamed:@"grid_list_select"] forState:UIControlStateNormal];
    [_gridBtn setImage:[UIImage imageNamed:@"grid_list_selected"] forState:UIControlStateSelected];
    [_gridBtn setImageEdgeInsets:UIEdgeInsetsMake(10, 20, 10, 0)];
    [_gridBtn addTarget:self action:@selector(gridClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_gridBtn];
    
    
    _bottomLineView = [[UIView alloc] init];
    _bottomLineView.backgroundColor = RGB(200, 200, 200);
    [self addSubview:_bottomLineView];
}

-(void) layoutSubviews
{
    [super layoutSubviews];
    
    //间距
    CGFloat margin = (ScreenW - 50*3-40-60)/3;
    
    [_comprehensiveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.size.mas_equalTo(CGSizeMake(50, 40));
        make.centerY.mas_equalTo(self);
    }];
    
    [_salesVolumeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(50, 40));
        [make.left.mas_equalTo(self.comprehensiveBtn.mas_right)setOffset:margin];
    }];
    
    [_gridBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.right.mas_equalTo(self.mas_right)setOffset:-30];
        make.size.mas_equalTo(CGSizeMake(40, 40));
        make.centerY.mas_equalTo(self);
    }];
    
    [_priceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(50, 40));
        [make.right.mas_equalTo(self.gridBtn.mas_left)setOffset:-margin];
    }];
    
    [_bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        [make.bottom.mas_equalTo(self.mas_bottom)setOffset:0];
        make.size.mas_equalTo(CGSizeMake(ScreenW, 1));
    }];
}

-(void)btnPressed:(UIButton *)sender{
    if(_tag == sender.tag&&sender.tag != 2) return;
    
    _tag = sender.tag;
    
    switch (sender.tag) {
        case 0:
            [_comprehensiveBtn setTitleColor:MColor forState:UIControlStateNormal];
            [_salesVolumeBtn setTitleColor:RGB(16, 0, 0) forState:UIControlStateNormal];
            [_priceBtn setTitleColor:RGB(16, 0, 0) forState:UIControlStateNormal];
            [_priceBtn setImage:[UIImage imageNamed:@"price_sort_defualt"] forState:UIControlStateNormal];
            _priceBtn.selected = NO;
            //按综合
            self.ComprehensiveClickBlock();
            break;
        case 1:
            [_comprehensiveBtn setTitleColor:RGB(16, 0, 0) forState:UIControlStateNormal];
            [_salesVolumeBtn setTitleColor:MColor forState:UIControlStateNormal];
            [_priceBtn setTitleColor:RGB(16, 0, 0) forState:UIControlStateNormal];
            [_priceBtn setImage:[UIImage imageNamed:@"price_sort_defualt"] forState:UIControlStateNormal];
            _priceBtn.selected = NO;
            //按销量
            self.SalesVolumeClickBlock();
            break;
        case 2:
            [_comprehensiveBtn setTitleColor:RGB(16, 0, 0) forState:UIControlStateNormal];
            [_salesVolumeBtn setTitleColor:RGB(16, 0, 0) forState:UIControlStateNormal];
            [_priceBtn setTitleColor:MColor forState:UIControlStateNormal];
            //按价格
            [self priceUpDownClick:self.priceBtn];
            break;
            
        default:
            break;
    }
}

-(void)priceUpDownClick:(UIButton *)sender{
    sender.selected = !sender.selected;
    if(sender.selected){
        [sender setImage:[UIImage imageNamed:@"price_sort_up"] forState:UIControlStateNormal];
        
    }else{
        [sender setImage:[UIImage imageNamed:@"price_sort_down"] forState:UIControlStateNormal];
    }
    //0：降序；1：升序
    self.PriceUpDownClickBlock(sender.selected);
}

-(void)gridClick:(UIButton *)sender{
    sender.selected = !sender.selected;
    if(self.gridBtn){
        self.GridClickBlock(sender.selected);
    }
}


@end
