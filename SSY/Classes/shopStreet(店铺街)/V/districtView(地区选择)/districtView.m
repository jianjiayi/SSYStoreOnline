//
//  districtView.m
//  SSY
//
//  Created by 大为科技 on 2018/8/10.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "districtView.h"

//按钮宽度
#define BTN_W 75
//按钮高度
#define BTN_H 30
//列数
#define COL_N 4

@interface districtView ()

@property (nonatomic, strong) UIView  *contentView;
@end


@implementation districtView

#pragma mark - Intail
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self setUpUI];
    }
    return self;
}

#pragma mark - UI
-(void)setUpUI{
    _bgView = [[UIView alloc] init];
    _bgView.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1/1.0];
    [self addSubview:self.bgView];


    
    for(int i =0 ;i < 31; i++){
        NSInteger row = i/COL_N;
        NSInteger col = i%COL_N;
        //间距
        CGFloat margin = (ScreenW - BTN_W*COL_N)/(COL_N+1);
        //X
        CGFloat picX = margin + (BTN_W+margin)*col;
        //Y
        CGFloat picY = margin + (BTN_H +margin)*row;
        
        //按钮frame
        _defaultBtn.frame = CGRectMake(picX, picY, BTN_W, BTN_H);
        _defaultBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        [_defaultBtn setTitle:@"河北省" forState:UIControlStateNormal];
        [_defaultBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.bgView addSubview:self.defaultBtn];
    }
}


#pragma mark - 布局
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self);
        make.top.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(ScreenW, 400));
    }];
}

@end
